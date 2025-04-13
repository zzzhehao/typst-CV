// #import "@preview/one-liner:0.2.0"

#let resume(body) = {
  set list(indent: 1em)
  show list: set text(size: 0.92em)
  show link: underline
  show link: set underline(offset: 3pt)

  set page(
    paper: "a4",
    margin: (x: 0.5in, y: 0.5in)
  )

  set text(
    size: 11pt,
    font: "Arial",
  )

  body
}


#let name_header(name) = {
  set text(size: 2.25em)
  [*#name*]
}

#let header(
  name: "Jake Ryan",
  phone: "123-456-7890",
  email: "jake@su.edu",
  linkedin: "linkedin.com/in/jake",
  site: "github.com/jake",
) = {
  align(center,
    block[
      #name_header(name) \
      #phone |
      #link("mailto:" + email)[#email] |
      #link("https://" + linkedin)[#linkedin] |
      #link("https://" + site)[#site]
    ]
  )
  v(5pt)
}

#let resume_heading(txt) = {
  show heading: set text(size: 0.92em, weight: "regular")

  block[
    = #smallcaps[#text(font: "libertinus serif")[#txt]]
    #v(-4pt)
    #line(length: 100%, stroke: 1pt + black)
  ]
}

#let edu_item(
  name: "Sample University", 
  degree: "B.S in Bullshit", 
  location: "Foo, BA", 
  date: "Aug. 1600 - May 1750",
  courses: (),
  courseworks: (),
  thesis: none
) = {
  set block(above: 0.7em, below: 1em)
  pad(left: 1em, right: 0.5em, bottom: 1em, box[
    #grid(
        columns: (3fr, 2fr), 
        align(left)[
        == #smallcaps[#text(font: "libertinus serif")[#name]] \
        _#degree _ \  
        ],
        align(right)[
        #location \
        _#date _ \  
        ]
    )

    #if courses != () {
        [Courses \
        #for course in courses {
        [ - #course ]  
        }]
    }

    #if courseworks != () {
        [Courseworks \
        #for cw in courseworks {
        [ - #cw ]  
        }]
    }

    #if thesis != none {
        [*Thesis:* #thesis.name \
            - Supervisor: #thesis.supervisor]
        }
  ])
}

#let exp_item(
  name: "Sample Workplace",
  role: "Worker",
  date: "June 1837 - May 1845",
  location: "Foo, BA",
  points: none
) = {
    set block(above: 0.7em, below: 1em)
    pad(left: 1em, right: 0.5em, bottom: 1em, box[
      #grid(
        columns: (3fr, 1.2fr),
        align(left)[
          == #smallcaps[#text(font: "libertinus serif")[#role]] \
          _#name _
        ],
        align(right)[
          #date \
          #location 
        ]
      )
    #if points != none {
        [#for point in points {
        [ - #point ]  
        }]
    }
    ])
}

#let teaching_item(
    role: "",
    course: "",
    affiliation: "",
    date: "",
    scale: "",
    location: "",
    points: none
) = {
    set block(above: 1em, below: 1em)
    pad(left: 1em, right: 0.5em, bottom: 1em, box[
        #grid(
        columns: (3fr, 1.2fr),
        align(left)[
          #text(size: 13pt)[*#smallcaps[#text(font: "libertinus serif")[#course]]*] | #role \
          _#affiliation _ \
          #scale
        ],
        align(right)[
          #date \
          #location 
        ]
      )
    #if points != none {
        [#for point in points {
        [ - #point ]  
        }]
    }
    ])
}

#let conf_item(
    title: "Contribution title",
    form: "Poster", 
    event: "Conference name",
    date: "09/2023",
    location: "location",
) = {
    set block(above: 0.7em, below: 0.5em)
    pad(left: 1em, right: 0.5em, bottom: 1em, box[
        *#text(font: "libertinus serif", size: 13pt)[#title]*
        #grid(
        columns: (3fr, 1fr),
        align(left)[
            #event \
            #form 
        ],
        align(right)[
            #date \
            #location 
        ]
        )
    ])
}

#let expedition_item(
    title: "",
    id: "",
    vessel: "",
    location: "",
    date: "",
    period: "",
    role: "",
    CI: "",
    PI: "",
    ops: none,
    points: none
) = {
    set block(above: 0.7em, below: 0.5em)
    pad(left: 1em, right: 0.5em, bottom: 1em, box[
        *#text(font: "libertinus serif", size: 13pt)[#title]* (#id)
        #grid(
            columns: (3fr, 1.5fr),
            align(left)[
            #vessel \
            #role
            ],
            align(right)[
            #date (#period)\
            #location 
            ]
        )
        #if CI != "" {
            [Chief Scientist: #CI \ ]
        }
        #if PI != "" {
            [Onboard Princible Investigator: #PI \ ]
        }
        #if ops != none {
            [Corresponding Gears: \
            #for op in ops {
            [- #op ]  
            }]
        }
        #if points != none {
            [Experiences: \ 
            #for point in points {
            [- #point ]  
            }]
        }
    ])
}

#let skill_item(
  category: "Skills",
  skills: "Balling, Yoga, Valorant",
) = {
  set block(above: 0.7em, below: 1em)
  set text(size: 0.91em)
  pad(left: 1em, right: 0.5em, block[*#category*: #skills])
}

#let reference_item(
    person: "",
    affiliation: "",
    address: "",
    email: "",
    tel: "",
    infos: none
) = {
    set block(above: 1em, below: 1em)
    pad(left: 1em, right: 0.5em, bottom: 1em, box[
        === #person
        #if affiliation != "" {
            [#affiliation \ ] 
        }
        #if address != "" {
            [#address \ ] 
        }
        #if email != "" {
            [#link("mailto:" + email)[#email] \ ]
        }
        #if tel != "" {
            [Tel.: #tel \ ]
        }
        #if infos != none {
            [
                #v(5pt)
                #for info in infos {
            [ - #info ]  
            }]
        }
    ])
}