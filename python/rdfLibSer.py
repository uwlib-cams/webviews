import os
import rdflib
from rdflib import *
import datetime

# NOTES: https://hackmd.io/@ries07/r1W0h6coI

# (AKM) Generate directories - program will generate a set of directories to save the exported records in
if not os.path.exists('export_xml'):# creates xml directory
    os.makedirs('export_xml')

# (AKM) Initializes a graph, loads in UW trellis repo, and extracts record URIS
    # (BMR) What does flush=True do and do I need it below as well?
print("...\nretrieving graph uris", flush=True)
G = Graph()
# (BMR) Okay, what happens if I load the graph in format RDF/XML??
    # Answer--it doesn't work
G.load('https://trellis.sinopia.io/repository/washington', format='turtle')

# (AKM) Namespace binding for easy access
LDP = Namespace('http://www.w3.org/ns/ldp#')
G.bind('LDP', LDP)
# (BMR) Need to understand next 3 lines especially
URIS = [] # (AKM) list for record uris
for o in G.objects(subject=None,predicate=LDP.contains):#records are described in the parent repo using ldp.contains
    URIS.append(o)

# (AKM) Concatenates individual records into singular graph
# (BMR) For future:
    # If the graph is held in memory at the time of serializing, might this
    # cause problems in future? Might need to break up the graph somehow
g = Graph()
for uri in URIS:
    g.parse(uri)

print("...\nsaving the graph")
g.serialize(destination='export_xml/'+str(datetime.date.today())+'.rdf', format='xml')
