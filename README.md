# SwiftHeaderTool

## Install
```
swift package experimental-install
```

## Uninstall
```
swift package experimental-uninstall SwiftHeaderTool
```

## Usage

Early version, do not use in production.

```
SwiftHeaderTool strip --path sourcedir
```

```
SwiftHeaderTool add --path sourcedir --template-path template.txt
```

```
SwiftHeaderTool replace --path sourcedir --template-path template.txt
```

### Example Template
```
$figlet(HyperKit)

$filename

Made by paxos in $date
```

will turn into

```
//
// #     #                                 #    #
// #     #  #   #  #####   ######  #####   #   #   #  #####
// #     #   # #   #    #  #       #    #  #  #    #    #
// #######    #    #    #  #####   #    #  ###     #    #
// #     #    #    #####   #       #####   #  #    #    #
// #     #    #    #       #       #   #   #   #   #    #
// #     #    #    #       ######  #    #  #    #  #    #
//
// CommitsService.swift
// Made by paxos in Mar 14, 2024
```
