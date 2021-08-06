# Atlas

Atlas is a simple feed rss generator. It acts as a http server listening on port 9000, when receive an HTTP GET request of this kind:
'http://localhost:9000/?url=gemini://example.com'

Atlas will retrieve the query URL, connect to the URL via a barebones gemini client and retrive all the URLs that match the specification for blog posts:

absolute/relative URL YYYY-MM-DD - TITLE

Then generate a feed rss and return it to the client.

## Installation

Manual install:

     perl Makefile.PL
     make
     make install

## Quickstart

First you need to start the server:

     atlas

This starts the server in the foreground for `localhost:9000`
Then you need to add the gemini capsules that you want to follow
in your favorite feed rss reader ( I'm using Elfeed ), in this way:

http://localhost:9000/?url=gemini://example1.com
http://localhost:9000/?url=gemini://example2.com
http://localhost:9000/?url=gemini://example3.com

You can also add another query that specify the number of articles/posts to retrieve ( default is 10 )

http://localhost:9000/?url=gemini://example1.com&5

This will retrive only 5 articles from example1.com

## Options

These are the options Atlas knows about:

- `--host` is the address to use; the default is 127.0.0.1
- `--port` is the port to use; the default is 9000

## Dependencies

There are some Perl dependencies you need to satisfy in order
to run this program:

- [IO::Socket::SSL](https://metacpan.org/pod/IO%3A%3ASocket%3A%3ASSL)
- [URI](https://metacpan.org/pod/URI)
- [CGI](https://metacpan.org/pod/CGI)
- [XML::RSS](https://metacpan.org/pod/XML%3A%3ARSS)
- [HTTP::Daemon](https://metacpan.org/pod/HTTP%3A%3ADaemon)
- [DateTime::Fromat::Strptime](https://metacpan.org/pod/DateTime%3A%3AFromat%3A%3AStrptime)

## License

GNU Affero General Public License
