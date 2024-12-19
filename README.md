# flutter_tex_dec

TODO: ![Screenshot of Feature Grid](./documentation/feature_grid.png)

TODO: Introduction: What is the package used for?...

## Features

- [x] Boxes
- [x] Underline
- [x] Wavy Box
- [x] Speech Bubble

You can see them in action with the [Example App](./example) we've provided

## Installation

### pub.dev
Add the following to your `pubspec.yaml`:

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

TODO: Add usage and image per feature

...

## Roadmap

Planned features:
- [ ] ...

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
