class: center, middle, no-number

.header[
<img height=60 src="images/ysda-white.png" style="padding-left: 4em">
]


&nbsp;

.title[Reproducible Machine Learning for Humans]

<!-- .remark-slide-number[abc] -->

.author[Nikita Kazeev on behalf on the Everware and REP teams]

.email[[kazeevn@yandex-team.ru](mailto:kazeevn@yandex-team.ru)]
&nbsp;

&nbsp;
.date[2016-10-13, 4th National eScience Symposium, Amsterdam, the Netherlands]

---
count: false
layout: true
.header-right[Nikita Kazeev, YSDA, Reproducible Machine Learning for Humans]
---

## Yandex School of Data Analysis
https://yandexdataschool.com
.libig[
- A non-commercial private university
- Free tuition, no employment obligations on
  part of the students (yet many go to Yandex)
- 450+ students graduated since 2007
- Strong education in Data & Computer Science
- Organizes a [Machine Learning Conference](https://yandexdataschool.com/conference/)
- Interest in interdisciplinary research (eScience)
– from Information Retrieval to Fundamental Science
- A full member of the LHCb experiment at CERN since 2015,
  an associate member during 2014-2015
]

---

## Me
.libig[
- A data scientist
- MSc in Physics
- Work for the LHCb collaboration at CERN 
  - Data storage optimization
  - A search engine for physics data
  - An automated anomaly detection systAem
- Taught machine learning at [Machine Learning in High Energy
  Physics Summer Schools](https://indico.cern.ch/event/497368/)
]
---

## Plan
.libig[
- The problem of research irreproducibility
- Our tools for computational experiments
  - Everware
  - Reproducible Experiment Platform (REP)
- Demo
]
---

## Irreproducibility indicators

.libig[
- ‘Which version of my code I used to generate figure 13?’
- ‘The new student wants to reuse that model I published three years ago but he can’t reproduce the figures’
- ‘I thought I’ve used the same parameters but I’m getting different results…’
- ‘Which dataset exactly did I use for algorithm comparison?‘
- ‘Why did I do that?!’
- ‘It worked yesterday!!’
]
---

## Cases in point: Medical science

Amgen (a commercial company) in 2012 
- 53 landmark papers in cancer drug development
- Scientific findings confirmed only in 6 (11%) cases

Bayer (a commercial company) in 2011
- 67 projects
- Results confirmed in 20-25% cases

A new study is under way and to be completed in 2017
- https://osf.io/e81xl/wiki/home/

.footnote-left[
* http://www.nature.com/nature/journal/v483/n7391/full/483531a.html
* http://www.nature.com/news/cancer-reproducibility-project-scales-back-ambitions-1.18938
* http://www.nature.com/nrd/journal/v10/n9/full/nrd3439-c1.html
]

---

## Nature's Reproducibility Survey

.center[<img src="images/is_crisis.jpeg" height=490>]

.footnote-left[
* [Nature: 1,500 scientists lift the lid on reproducibility](http://www.nature.com/news/1-500-scientists-lift-the-lid-on-reproducibility-1.19970) by Monya Baker
* [raw survey data (link)](https://figshare.com/articles/Nature_Reproducibility_survey/3394951/1)
]

---
.center[<img src="images/the_boost.jpg" height=650>]
---

## ...part of the story

#### _Computational experiment_ is a significant part of the experiment, that starts as data collected. Reproducibility of that part being just a partial answer can be aided technologically.

Possible effects (see the previous slide):

- Practical
    - better mentoring/supervision
    - more within-lab validation
    - simplified external-lab validation
    - incentive for better practice
    - robust design
- Educational
    - wider access to the best practices 
    - better teaching

---

## Tools in High Energy Physics
+ __data__ storage
    + shared storage (XROOTD, AFS, EOS, CERNBOX)
- standardized __environment__
    - software: ROOT, minuit, RooFit, experiment-stack, ...
    - computational cluster (e.g. `lxplus`)
+ __code__ versioning repository (gitlab)
- advanced analysis approaches
    - blind analysis
    - reviews, cross-checks within group, inter-group collaboration
+ collaborative culture
    + q&a groups, experts
    + publishing workflow
- double experiment-checks

---

## Reproducibility key components

.libig[
- Basic assumptions (vocabulary)
- Data
- Environment + Resources (CPU/GPU)
- Code
- Workflow
- Automated intermediate results checks
- Final results (datasets, publications)
]


---

## Common environment

Enter Reproducible Experiment Platform (**REP**)

--
- Python-based (numpy, pandas, …), Jupyter-friendly

--
- Unified scikit-learn-like API to many
  ML packages (Sklearn, XGBoost, uBoost, TMVA, Theanets, … )

--
- Meta-algorithms pipelines («REP-Lego»)

--
- Configurable interactive reporting & visualization  to ensure model quality (e.g. check for overfitting)

--
- Pluggable quality metrics

--
- Paralleled training of classifiers & grid search (IPython parallel)

--
- Open-source, Apache 2.0: https://github.com/yandex/rep
- Well-documented, supported by Yandex, http://yandex.github.io/rep/

---

## A reproducible study example
https://github.com/everware/everware-dimuon-example
--

- __data__: CERNBOX
--

- __common environment__: REP
--

- __environment management__: Docker
--

- GitHub: analysis __code and environment versioning__
--

- continuous integration: intermediate __results checks__ & report
--


Steps to run:
- install Docker
  + https://docs.docker.com/engine/installation/
- clone the repository
  + `git clone https://github.com/everware/everware-dimuon-example.git`
- build the Docker image (will need to download ~500 Mb)
  + `docker build . -t dimuon`
- run Docker with the repository folder mounted and Jupyter port forwarded
  + `docker run -it -p 127.0.0.1:8888:8888 -v $(pwd):/notebooks dimuon bash`
- insider run Jupyter
  + `cd /notebooks && jupyter notebook --no-browser`
- with the browser go to [127.0.0.1:8888](http://127.0.0.1:8888)
--

---

## A reproducible study example
https://github.com/everware/everware-dimuon-example
- __data__: CERNBOX
- __common environment__: REP
- __environment management__: Docker
- GitHub: analysis __code and environment versioning__
- continuous integration: intermediate __results checks__ & report

Or you can use *Everware* - just [click](https://everware.rep.school.yandex.net/hub/oauth_login?repourl=https://github.com/everware/everware-dimuon-example).

---

## Everware is ...

... about re-useable science, it allows people to jump right in to your research code. Lets you launch _Jupyter_ notebooks from a git repository with a click of a button. 

- https://github.com/everware - Code
- https://everware.rep.school.yandex.net - Yandex instance

More examples:
- algorithm meta-analysis, .small[https://github.com/openml/study_example]
- gravitational waves, .small[https://github.com/anaderi/GW150914]
- COMET, .small[https://github.com/yandexdataschool/comet-example-ci]

--


---

## Under the hood of Everware 

.libig[
- an extension for _JupyterHub_:
    - a spawner for building and running custom _Docker_ images
- integrated with:
    + Dockerhub
    + GitHub (for authentication and repository interaction)
]

---

## Pros &amp; cons

.left-column[
### Pros
- easier supervision/mentoring
- easier within-lab validation
- wider access to the best practices
- simplified cross-lab validation
- good incentive for formal reproduction
- _good thing for industry career track development_
- access to wider set of practices

### Cons
- learning a bit of open-source technology
- re-organize internal research process
- inner barrier for openness
- higher incentive for mindless _borrowing_
- environments divergence
]
.right-column[
<img src="images/the_boost.jpg" height="480">
]

---

## Research workflow with everware

<img src="images/everware-flow.png" height="480">

.footnote-center[.small[https://github.com/everware/everware/wiki/How-to-embed-everware-into-research-use-cases]]

---

## Education workflow with everware

.left-column[
.center[<img src="images/everware-teach-flow.svg" height=550>]]
.right-column[
- Python course at YSDA 2015
- MLHEP Machine Learning summer schools 2015 and 2016
- YSDA course on Machine learning at Imperial College London 2016
- Kaggle competitions 2016
- Machine learning course at University of Eindhoven
- LHCb open data masterclass
]
---

## Roadmap

.libig[
- Integrate with data sharing resources (zotero, figshare, etc)
- Automatic capture of environment (integrate with repro-zip)
- Integration with publishing resources ([gitxiv](https://gitxiv.com), re-science, [openml](https://openml.org))
- Not only jupyter-based computations
- .gray[Bring your own resources computational model]
]
---

## Conclusion

.libig[
- Reproducibility depends on humans
  - Can be helped with human-facing technology;
- _Everware works_ for research and education;
    - easy to [try](https://everware.rep.school.yandex.net/hub/oauth_login?repourl=https://github.com/everware/everware-dimuon-example);
    - WIP, https://github.com/everware
       - feature requests are welcome
       - pull requests are most welcome
- REP might work as a common environment for your ML study
  - it also has nice tools to ease the routine
]

---
layout: false
class: middle, center, inverse, no-number

# Thank you!

---
count: false
layout: false
class: middle, center, inverse, no-number

# Backup
---
count: false
layout: false
class: center, inverse, no-number

## Everware demo

Running https://github.com/everware/everware-dimuon-example

<video src="downloads/run-dimuon-480p.m4v" height=480 controls="true" autoplay="false" preload="">
Sorry, printed version doesn't support animation.
<img src="images/runme.png", width=800>
</video>

---
count: false
layout: true
.header-right[Nikita Kazeev, YSDA, Reproducible Machine Learning for Humans]
---
count: false

## Yandex services landscape (est 1997)
- Web search
- Image search
- Speech recognition
- Car traffic prediction
- Mail and spam filtering
- Natural language translation
- Market (shopwindow for internet shops)
- Yandex Data Factory (https://yandexdatafactory.com)
- Yandex School of Data Analysis 
    - (full member of LHCb since Dec'15)

---
count: false

## References

- http://www.nature.com/news/1-500-scientists-lift-the-lid-on-reproducibility-1.19970
- https://rescience.github.io/read/
- http://push.cwcon.org/
- https://openml.org
- https://figshare.com/
- https://gitlab.cern.ch/lhcb-bandq-exotics/Lb2LcD0K
- https://osf.io/ezcuj/wiki/home/
- https://osf.io/e81xl/wiki/home/
- Center for open science, https://cos.io/
- IPFS, https://github.com/ipfs/
- Nature, keyword: reproducibility, http://www.nature.com/news/reproducibility-1.17552

---
count: false

## Dealing with cognitive bias

.center[<img src="images/cognitive_biases.jpeg" height=500>]

.small[http://go.nature.com/nqyohl]