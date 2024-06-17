#set text (
    dir:rtl,
    font: "SimSun",
    size:25pt,
    lang: "zh"
)
#let char_per_line = 25 *3 //3 bytes per char
#let vertical_text(content) = {
    let a = ()
    let l = 0
    while l*char_per_line < content.len() {
      let cn = char_per_line
      if ((l*char_per_line + cn) >content.len()) {
        cn = content.len() -l*char_per_line
      }
      a.push(content.slice(l*char_per_line, count: cn))
      l+=1
    }
    let c = ()
    for l in a {
      let b = l
      c.push(stack(dir:ttb, 
            spacing: 7pt,
            ..b.clusters()
      ))
    }
    stack(dir:rtl, 
        spacing: 2pt,
        ..c
    )
}

#show: p=> {
  let text_list = ()
  if (p.has("children")) {
    text_list = p.children
  } else {
    text_list.push(p)
  }
  for c in text_list {
    if c.has("text") {
      vertical_text(c.text)
    } else {
      if c.has("body") {
        vertical_text(c.body.text)
        pagebreak()
      } else {
        pagebreak()  
      }
    }
  }
}
山不在高有仙則名水不在深有龍則靈斯是陋室惟吾德馨苔痕上階綠草色入簾青談笑有鴻儒往來無白丁可以調素琴閱金經無絲竹之亂耳無案牘之勞形南陽諸葛廬西蜀子雲亭孔子云何陋之有
