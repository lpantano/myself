import bibtexparser
from bibtexparser.bparser import BibTexParser
from bibtexparser.customization import convert_to_unicode
import string
from os import path as op
from unidecode import unidecode

def remove_specials(text):
	return text.replace(":","").replace(",","").replace("{","").replace("}","").replace("'","")

def clean(text):
	return text.replace("%","pct").replace("{","").replace("}","")

with open('files/MyLibrary.bib') as bibtex_file:
    parser = BibTexParser()
    parser.customization = convert_to_unicode
    bib_database = bibtexparser.load(bibtex_file, parser=parser)

# Your Name, You. (2009). "Paper Title Number 1." <i>Journal 1</i>. 1(1).
template = op.normpath(op.join(op.dirname(op.realpath(__file__)), "pub_template.md"))
content = open(template).read()
idx = 0
for paper in bib_database.entries:
	idx += 1
	abstract = unidecode(paper['abstract']) if 'abstract' in paper else 'comming soon'
	authors = remove_specials(unidecode(paper['author'])).split(" and ")
	authors = [ "%s %s" % (a.split()[1][0], a.split()[0]) for a in authors]
	summary = unidecode(abstract[:50])
	link = "www.ncbi.nlm.nih.gov/pubmed/?term=%s" % paper['pmid'] if 'pmid' in paper else "Comming soon"
	authors =[a.replace("L Rubino", "L Pantano") for a in authors]
	authors = (",").join([a if a !="L Pantano" else "**L Pantano**" for a in authors])

	print remove_specials(unidecode(paper['title']))
	citation = ("{authors} ({year}) {title} <i>{journal}</i>").format(authors=authors,
                    year=paper['year'],
                    title=remove_specials(unidecode(paper['title'])),
                    journal=remove_specials(unidecode(paper['journal'])))
	alpha_journal = ''.join(ch for ch in unidecode(paper['journal']) if ch.isalnum())
	file_name = "%s-%s-%s" % (paper['year'], alpha_journal, idx)
	out_content = string.Template(content).safe_substitute({'title': unidecode(remove_specials(paper['title'])),
															'file_name': file_name,
															'journal': remove_specials(unidecode(paper['journal'])),
															'paper_url': link,
															'citation': citation,
															'authors': unidecode(authors),
															'abstract': clean(abstract)})
	outname = op.join("_publications", "%s.md" % file_name)
	#print out_content
	with (open(outname, 'w')) as outh:
		print>>outh, out_content
