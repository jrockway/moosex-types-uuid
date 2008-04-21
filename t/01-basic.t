use strict;
use warnings;
use Test::Exception;
use Test::More tests => 2;

{ package Class;
  use Moose;
  use MooseX::Types::UUID qw(UUID);
  
  has 'uuid' => ( is => 'ro', isa => UUID );
}

lives_ok {
    Class->new( uuid => '77C71F92-0EC7-11DD-B986-DF138EE79F6F' );
} 'valid UUID works';

throws_ok {
    Class->new( uuid => 'there is no way you could possibly think this is a UUID' );
} qr/does not pass the type constraint/;
