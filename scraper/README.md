Scraper
=======

A Python3 script utilising Beautiful Soup
used to scrape BMC Bioinformatics papers matching particular keywords.

Results limited between provided dates,
and should be further (manually) filtered to avoid false positives.

The strainer definitions in the top few lines of `scraper.py`
should be reviewed in case of changes in the BMC Bioinformatics website.

## Dependencies

Ensure the following dependencies are installed:

- Python 3.
- [Beautiful Soup](https://www.crummy.com/software/BeautifulSoup) 4.5.1.

With them, you can run the script directly:

```
./scraper.py 2015/09/01 2016/08/31 -s "sequence-analysis-methods-" -t software -k fasta fastq
```

Alternatively, you can use Docker to run the script and thus avoid managing dependencies (other than Docker).
First build:

```
docker build --rm -t crawler .
```

And then you can run the scraper in the same way you would've with Python,
except replacing the `./scraper.py` part with `docker run --rm scraper`.

## Usage

```
./scraper.py -h
```

Note that it takes a while to execute, as it synchronously downloads web pages.
If you're concerned that it's not functioning, you should add some verbosity to see what's going on.

## Development

- If using Docker, don't forget to rebuild before running.
  Combining the two commands could help.
- Here's a copy/paste-able full example command:

```
docker build --rm -t scraper . && \
docker run --rm scraper \
    2015/09/01 2016/08/31 -vvv \
    -s "sequence-analysis-applications-" "sequence-analysis-methods-" \
    -k fasta fastq " embl" gcg genbank " sam[ .,]"
```
