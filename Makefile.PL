use 5.008004;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME             => 'App::atlas',
  VERSION_FROM     => 'lib/App/atlas.pm',
  ABSTRACT_FROM    => 'lib/App/atlas.pm',
  AUTHOR           => 'Heph',
  LICENSE          => 'agpl_3',
  MIN_PERL_VERSION => '5.26.0', # Modern::Perl '2018'
  EXE_FILES        => [
    'script/atlas',
  ],
  PREREQ_PM        => {
    'strict'   => 0,
    'warnings' => 0,
    'IO::Socket::SSL' => 0,
    'XML::RSS' => 0,
    'URI' => 0,
    'CGI' => 0,
    'DateTime::Format::Strptime' => 0,
    'HTTP::Daemon' => 0,
    'HTTP::Status' => 0,
  },
  META_MERGE => {
    'meta-spec' => { version => 2 },
    resources => {
      repository => {
	type => 'git',
	url  => 'https://git.mrkeebs.eu/atlas/',
	web  => 'https://git.mrkeebs.eu/atlas//about/',
      },
    },
  },
  clean => {
    FILES => "test target",
  },
);
