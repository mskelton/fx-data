# FX Data

Historical Forex data collector.

## Installation

To install the EA on macOS, run the following command.

```bash
make link
```

## Usage

To use run the EA named `Download` with the desired period, run the EA in the strategy tester with the following settings:

- **Modelling** set to **Open prices only**.
- **Date** set to **Entire history**

After running the EA, run the following command to copy the generated files into this repo.

```bash
make copy
```
