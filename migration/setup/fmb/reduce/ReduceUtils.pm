package ReduceUtils;
use strict;
use warnings;

use Exporter;
use vars qw(@ISA @EXPORT);

@ISA    = qw(Exporter);
@EXPORT = qw(replace txt2re);


sub replace {
	my $number_of_arguments = @_;
	my $txt = shift;
	my $context;

	if ($number_of_arguments == 4) {
		$context = shift;
		chomp $context;
		$context = txt2re($context);
	}

	my $in  = shift;
	my $out = shift;
	
	# Obcinamy ostatni '\n', żeby można było zastępować wewnętrzne fragmenty.
	chomp $in;
	chomp $out;

	$in  = txt2re($in);

	$out =~ s/([\<\>])/\\$1/g;
	$out =~ s/\n/\\n/g;

	if ($ENV{'VERBOSE'}) {
		print "## $context " if $context;
		print "@@ $in @@ $out @@\n";
	}

	if ($context) {
		my @matches;
		eval("\@matches = (\$txt =~ m{($context)}smgi);");

		foreach my $context_match (@matches) {
			my $context_in = $context_match;
			eval("\$context_match =~ s{$in}{$out}smgi;");
			my $context_out = $context_match;
			$context_out =~ s/([\$\@])/\\$1/g;

			$context_in  = txt2re($context_in);

#			print "## CONTEXT IN:\n$context_in\n\n\n"; 
#			print "## CONTEXT OUT:\n$context_out\n\n\n";
	
			eval("\$txt =~ s{$context_in}{$context_out}smgi;");
		}

	} else {
#		print("\$txt =~ s{$in}{$out}smgi;");
		eval("\$txt =~ s{$in}{$out}smgi;");
	}

	return $txt;
}

sub txt2re {
	my $txt = shift;
	my $re  = '';

	my $x  = 'NORMAL';  # NORMAL, SPACE, RE, RE_START, RE_END

	foreach my $c (split(//, $txt)) {

		if ($c eq '{') {
			if ($x eq 'NORMAL') {
				$x = 'RE_START';
				next;

			} elsif ($x eq 'SPACE') {
				$re .= '\\s*';

				$x = 'RE_START';
				next;

			} elsif ($x eq 'RE_START') {
				$x = 'RE';
				next;
			}

		} elsif ($c eq '}') {
			if ($x eq 'RE') {
				$x = 'RE_END';
				next;

			} elsif ($x eq 'RE_END') {
				$x = 'NORMAL';
				next;
			}
		}

		if ($x eq "RE_START") {
			$re .= "\\{";
			$x   = "NORMAL"; 
		} 

		if ($x eq "RE_END") {
			$re .= "\\}";
			$x   = "RE"; 
		}

		if ($x eq 'RE') {
			if ($c eq ' ' or $c eq "\t" or $c eq "\n") {
				next;
			}

			$re .= $c;
			next;

		} else {
			if ($c eq ' ' or $c eq "\t" or $c eq "\n") {
				$x = "SPACE";
				next;
			
			} else {
				if ($x eq "SPACE") {
					$re .= "\\s+";
				}

				if (index('[](){}$./+*?|\\@', $c) >= 0) {
					$re .= '\\';
				}

				$re .= $c;
				
				$x = "NORMAL";
				next;
			}
		}
	}

	# Jeśli ostatni był biały znak, dodajemy '\s+'
	if ($x eq "SPACE") {
		$re .= "\\s+";
	}
	
	return $re;
}

1;


