# flutter_tex_dec

![Screenshot of Feature Grid](./documentation/img/overview.png)

Bring your words to life leveraging flutter_tex_dec with wavy underlines, colorful boxes, speech bubbles and more. Whether you want to highlight important details, add a playful touch or simply stand out. The package makes it easy to add personality and flair to your text.

## Features

- [x] Boxes
- [x] Underline
- [x] Wavy Box
- [x] Speech Bubble

Feel free to check out the [Example App](./example) and play around.

## Installation

### pub.dev

Add flutter_tex_dec as dependency to `pubspec.yaml`:

```
dependencies:
  flutter_tex_dec: ^0.1.0
```

## Usage

### Box Decorator

```
TextDrawDecorator.boxed(
  style: BoxStyle.rounded,
  text: const Text(
    'Bubble Text',
    style: TextStyle(fontSize: 32),
  ),
  strokeWidth: 2,
),
```

![Box Decorator Example](./documentation/img/box.png)

### Circle Decorator

```
TextDrawDecorator.circled(
  style: CircleStyle.openCircled,
  text: const Text(
    'Open Circled',
    style: TextStyle(fontSize: 32),
  ),
),
```

![Circle Decorator Example](./documentation/img/circle.png)

### Underline Decorator

```
TextDrawDecorator.underlined(
  text: const Text(
    'Underlined with Text',
    style: TextStyle(fontSize: 24),
  ),
  color: Colors.orange,
  strokeWidth: 2,
),
```

![Underline Decorator Example](./documentation/img/underline.png)

### Highlight Decorator

```
TextDrawDecorator.highlighted(
  text: const Text(
    'Highlighted Text',
    style: TextStyle(fontSize: 32),
  ),
),
```

![Underline Decorator Example](./documentation/img/highlight.png)

## Roadmap

### TODOs

- [ ] Fix Wavy Box corners

### Planned features

- [ ] Comic effect

## Contributing

See [CONTRIBUTING](./CONTRIBUTING.md)

## Authors and acknowledgment

Authors:

- [Tobias Rump](https://github.com/TobiasRump)
- [Jonas Klock](https://github.com/jay-k98)

Special Thanks:

- Noah Bauer for the creative name of this package

## License

See [LICENSE](./LICENSE)
