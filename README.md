# APEX Mermaid Diagrams Plugin

It's region based on [mermaidjs][0] work, it generate some diagrams by interpreting and converting your text code.

![mermaidchart][image_ref_a32ff4ads]

For an sample, paste the code below and click _**Generate**_ button to see the result:   

## `For Flowchart`
```javascript
graph TD
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
<button type="button" class="t-Button t-Button--icon t-Button--link t-Button--iconLeft"><span aria-hidden="true" class="t-Icon t-Icon--left fa fa-paste"></span>Try it</button>

## `Sequence diagram`
```yaml
sequenceDiagram
    Alice->John: Hello John, how are you?
    loop Every minute
        John-->Alice: Great!
    end
```

## `Class diagram`
```yaml
classDiagram
      Animal <|-- Duck
      Animal <|-- Fish
      Animal <|-- Zebra
      Animal : +int age
      Animal : +String gender
      Animal: +isMammal()
      Animal: +mate()
      class Duck{
          +String beakColor
          +swim()
          +quack()
      }
      class Fish{
          -int sizeInFeet
          -canEat()
      }
      class Zebra{
          +bool is_wild
          +run()
      }
```

```
stateDiagram-v2
    [*] --> Still
    Still --> [*]

    Still --> Moving
    Moving --> Still
    Moving --> Crash
    Crash --> [*]
```
   
Enjoy


 [0]: https://mermaid-js.github.io
[image_ref_a32ff4ads]:https://mermaid-js.github.io/mermaid/img/header.png
