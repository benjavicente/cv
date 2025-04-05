#import "template.typ" as cv
#show: cv.template

#let data = yaml("/cv.yml")

= #data.personal.name

#cv.contact(
  cv.simple_link(data.personal.linkedin),
  cv.simple_link(data.personal.github)
)

== Educación

#for edu in data.education [
  #block[
    *#(edu.name)* #h(1fr) #edu.location \
    _#(edu.degree)_ #h(1fr) _#(edu.date)_
  ]
]

== Experiencia

#for exp in data.experience [
  #block(inset: (bottom: 6pt))[
    *#(exp.name)* #h(8pt) #text(exp.description, fill: gray) #h(1fr) #if "url" in exp { cv.simple_link(exp.url) } \
    #block(
      inset: (left: 2pt),
      block(
        inset: (left: 6pt),
        stroke: (left: 1pt + gray),
        for role in exp.roles {
          block()[
            *#(role.name)* #h(1fr) _#(role.date)_ \
            #pad(left: 8pt,
              for point in role.points [
                - #cv.md(point)
              ],
            )
          ]
        }
      )
    )
  ]
]

== Extracurriculum

#for extracurriculum in data.extracurriculum [
  #block[
    *#(extracurriculum.name)* #h(1fr) _#(extracurriculum.date)_ \
    #block(inset: (left: 8pt, bottom: 6pt))[
        #for point in extracurriculum.points [
          - #cv.md(point)
      ]
    ]
  ]
]
