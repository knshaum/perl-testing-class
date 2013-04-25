PERLLIB_SWITCHES=-I cpan/lib/perl5 -I lib
PROVE_SWITCHES=$(PERLLIB_SWITCHES) -r

test :
	@prove $(PROVE_SWITCHES)

testcover :
	@cover -delete
	@HARNESS_PERL_SWITCHES=-MDevel::Cover=+ignore,^cpan/,+ignore,^t/ prove $(PROVE_SWITCHES)
	@cover
	@cd cover_db && ln -s coverage.html index.html

