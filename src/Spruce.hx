using Nuke;

function useBaseStyles() {
  Css.global({
    '*, *::before, *::after': {
      boxSizing: 'border-box'
    },
    body: {
      margin: 0,
      fontFamily: theme(spruce.font.sans),
      fontSize: theme(spruce.font.size.normal),
      fontWeight: theme(spruce.font.weight.normal),
      lineHeight: theme(spruce.font.lineHeight.normal),
      color: theme(spruce.color.neutral900),
      backgroundColor: theme(spruce.color.neutral0)
    },
    'h6, h5, h4, h3, h2, h1': {
      fontFamily: theme(spruce.heading.font.family),
      marginTop: 0,
      marginBottom: .5.rem(),
      fontWeight: 500,
      lineHeight: 1.2,
      color: theme(spruce.heading.color)
    },
    'h1': {
      fontSize: 1.375.rem() + 1.5.vw()
    },
    'h2': {
      fontSize: 1.325.rem() + 0.9.vw()
    },
    'h3': {
      fontSize: 1.3.rem() + 0.6.vw()
    },
    'h4': {
      fontSize: 1.275.rem() + 0.3.vw()
    },
    'h5': {
      fontSize: 1.25.rem()
    },
    'h6': {
      fontSize: 1.rem()
    },
    'p': {
      marginTop: 0,
      marginBottom: 1.rem()
    },
    'b, strong': {
      fontWeight: 'bolder'
    },
    // @todo: more
    '[role=button]': {
      cursor: 'pointer'
    },
    'button:not(:disabled), [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled)': {
      cursor: 'pointer'
    },
    'select': {
      wordWrap: 'normal'
    },
    '[hidden]': {
      display: ['none', '!important']
    },
    'figure': {
      margin: 0,
      padding: 0
    },
    'button': {
      outline: 0,
      border: 0
    }
  });
}

function useLightColors() {
  Theme.global({
    spruce: {
      color: {
        primitive: {
          gray50: rgb(249, 249, 249),
          gray100: rgb(244, 244, 245),
          gray200: rgb(228, 228, 231),
          gray300: rgb(212, 212, 216),
          gray400: rgb(161, 161, 171),
          gray500: rgb(113, 113, 122),
          gray600: rgb(82, 82, 91),
          gray700: rgb(63, 63, 70),
          gray800: rgb(39, 39, 42),
          gray900: rgb(24, 24, 27),
          gray950: rgb(19, 19, 22),

          sky50: rgb(240, 249, 255),
          sky100: rgb(224, 242, 254),
          sky200: rgb(186, 230, 253),
          sky300: rgb(125, 211, 252),
          sky400: rgb(56, 189, 248),
          sky500: rgb(14, 165, 233),
          sky600: rgb(2, 132, 199),
          sky700: rgb(3, 105, 161),
          sky800: rgb(7, 89, 133),
          sky900: rgb(12, 74, 110),
          sky950: rgb(11, 50, 73),

          green50: rgb(240, 253, 244),
          green100: rgb(220, 252, 231),
          green200: rgb(187, 247, 208),
          green300: rgb(134, 239, 172),
          green400: rgb(74, 222, 128),
          green500: rgb(34, 197, 94),
          green600: rgb(22, 163, 74),
          green700: rgb(21, 128, 61),
          green800: rgb(22, 101, 52),
          green900: rgb(20, 83, 45),
          green950: rgb(12, 49, 27),

          red50: rgb(254, 242, 242),
          red100: rgb(254, 226, 226),
          red200: rgb(254, 202, 202),
          red300: rgb(252, 165, 165),
          red400: rgb(248, 113, 113),
          red500: rgb(239, 68, 68),
          red600: rgb(220, 38, 38),
          red700: rgb(185, 28, 28),
          red800: rgb(153, 27, 27),
          red900: rgb(127, 29, 29),
          red950: rgb(80, 20, 20),

          // etc
        },
        
        primary50: theme(spruce.color.primitive.sky50),
        primary100: theme(spruce.color.primitive.sky100),
        primary200: theme(spruce.color.primitive.sky200),
        primary300: theme(spruce.color.primitive.sky300),
        primary400: theme(spruce.color.primitive.sky400),
        primary500: theme(spruce.color.primitive.sky500),
        primary600: theme(spruce.color.primitive.sky600),
        primary700: theme(spruce.color.primitive.sky700),
        primary800: theme(spruce.color.primitive.sky800),
        primary900: theme(spruce.color.primitive.sky900),
        primary950: theme(spruce.color.primitive.sky950),

        success50: theme(spruce.color.primitive.green50),
        success100: theme(spruce.color.primitive.green100),
        success200: theme(spruce.color.primitive.green200),
        success300: theme(spruce.color.primitive.green300),
        success400: theme(spruce.color.primitive.green400),
        success500: theme(spruce.color.primitive.green500),
        success600: theme(spruce.color.primitive.green600),
        success700: theme(spruce.color.primitive.green700),
        success800: theme(spruce.color.primitive.green800),
        success900: theme(spruce.color.primitive.green900),
        success950: theme(spruce.color.primitive.green950),
        
        warning50: theme(spruce.color.primitive.amber50),
        warning100: theme(spruce.color.primitive.amber100),
        warning200: theme(spruce.color.primitive.amber200),
        warning300: theme(spruce.color.primitive.amber300),
        warning400: theme(spruce.color.primitive.amber400),
        warning500: theme(spruce.color.primitive.amber500),
        warning600: theme(spruce.color.primitive.amber600),
        warning700: theme(spruce.color.primitive.amber700),
        warning800: theme(spruce.color.primitive.amber800),
        warning900: theme(spruce.color.primitive.amber900),
        warning950: theme(spruce.color.primitive.amber950),

        danger50: theme(spruce.color.primitive.red50),
        danger100: theme(spruce.color.primitive.red100),
        danger200: theme(spruce.color.primitive.red200),
        danger300: theme(spruce.color.primitive.red300),
        danger400: theme(spruce.color.primitive.red400),
        danger500: theme(spruce.color.primitive.red500),
        danger600: theme(spruce.color.primitive.red600),
        danger700: theme(spruce.color.primitive.red700),
        danger800: theme(spruce.color.primitive.red800),
        danger900: theme(spruce.color.primitive.red900),
        danger950: theme(spruce.color.primitive.red950),

        neutral0: rgb(255, 255, 255),
        neutral50: theme(spruce.color.primitive.gray50),
        neutral100: theme(spruce.color.primitive.gray100),
        neutral200: theme(spruce.color.primitive.gray200),
        neutral300: theme(spruce.color.primitive.gray300),
        neutral400: theme(spruce.color.primitive.gray400),
        neutral500: theme(spruce.color.primitive.gray500),
        neutral600: theme(spruce.color.primitive.gray600),
        neutral700: theme(spruce.color.primitive.gray700),
        neutral800: theme(spruce.color.primitive.gray800),
        neutral900: theme(spruce.color.primitive.gray900),
        neutral950: theme(spruce.color.primitive.gray950),
        neutral1000: rgb(0, 0, 0),
      }
    }
  });
}

function useDefaultTheme() {
  Theme.global({
    spruce: {
      border: {
        size: .25.em(),
        radius: {
          small: 0.1875.rem(), /* 3px */
          medium: 0.25.rem(), /* 4px */
          large: 0.5.rem(), /* 8px */
          xLarge: 1.rem(), /* 16px */
          
          circle: 50.pct(),
          pill: 9999.px()
        },
      },
      shadow: {
        xSmall: [ 0, 1.px(), 2.px(), rgba(113, 113, 122, .06) ],
        small: [ 0, 1.px(), 2.px(), rgba(113, 113, 122, .12) ],
        medium: [ 0, 2.px(), 4.px(), rgba(113, 113, 122, .12) ],
        large: [ 0, 2.px(), 8.px(), rgba(113, 113, 122, .12) ],
        xLarge: [ 0, 4.px(), 16.px(), rgba(113, 113, 122, .12) ],
      },
      spacing: {
        '3xSmall': 0.125.rem(), /* 2px */
        '2xSmall': 0.25.rem(), /* 4px */
        xSmall: 0.5.rem(), /* 8px */
        small: 0.75.rem(), /* 12px */
        medium: 1.rem(), /* 16px */
        large: 1.25.rem(), /* 20px */
        xLarge: 1.75.rem(), /* 28px */
        '2xLarge': 2.25.rem(), /* 36px */
        '3xLarge': 3.rem(), /* 48px */
        '4xLarge': 4.5.rem(), /* 72px */
      },
      font: {
        mono: list(
          'SFMono-Regular',
          'Consolas', 
          '"Liberation Mono"', 
          'Menlo', 
          'monospace'
        ),
        sans: list(
          '-apple-system', 
          'BlinkMacSystemFont', 
          '"Segoe UI"', 
          'Roboto', 
          'Helvetica', 
          'Arial', 
          'sans-serif',
          '"Apple Color Emoji"', 
          '"Segoe UI Emoji"', 
          '"Segoe UI Symbol"'
        ),
        serif: list(
          'Georgia', 
          '"Times New Roman"', 
          'serif'
        ),
        size: {
          '2xSmall': 0.625.rem(), /* 10px */
          xSmall: 0.75.rem(), /* 12px */
          small: 0.875.rem(), /* 14px */
          medium: 1.rem(), /* 16px */
          large: 1.25.rem(), /* 20px */
          xLarge: 1.5.rem(), /* 24px */
          '2xLarge': 2.25.rem(), /* 36px */
          '3xLarge': 3.rem(), /* 48px */
          '4xLarge': 4.5.rem(), /* 72px */
        },
        weight: {
          light: 300,
          normal: 400,
          semibold: 500,
          bold: 700,
        },
        spacing: {
          denser: (-0.03).em(),
          dense: (-0.015).em(),
          normal: 'normal',
          loose: 0.075.em(),
          looser: 0.15.em(),
        },
        lineHeight: {
          denser: 1,
          dense: 1.4,
          normal: 1.8,
          loose: 2.2,
          looser: 2.6
        }
      },
      focus: {
        ringColor: theme(spruce.color.primary600),
        ringStyle: 'solid',
        ringWidth: 3.px(),
        ringOffset: 1.px(),
        ring: [ 
          theme(spruce.focus.ringStyle),
          theme(spruce.focus.ringWidth),
          theme(spruce.focus.ringColor) 
        ]
      },
      input: {
        height: {
          small: 1.875.rem(), /* 30px */
          medium: 2.5.rem(), /* 40px */
          large: 3.125.rem(), /* 50px */
        },
        background: {
          color: theme(spruce.color.neutral0),
          colorHover: theme(spruce.input.background.color),
          colorFocus: theme(spruce.input.background.color),
          colorDisabled: theme(spruce.color.neutral100),
        },
        border: {
          color: theme(spruce.color.neutral300),
          colorHover: theme(spruce.color.neutral400),
          colorFocus: theme(spruce.color.neutral500),
          colorDisabled: theme(spruce.color.neutral300),
          width: 1.px(),
          radius: {
            small: theme(spruce.border.radius.medium),
            medium: theme(spruce.border.radius.medium),
            large: theme(spruce.border.radius.medium),
          }
        },
        required: {
          content: '*',
          contentOffset: (-2).px(),
          contentColor: theme(spruce.input.label.color)
        }
      },
      button: {
        font: {
          small: theme(spruce.font.size.xSmall),
          medium: theme(spruce.font.size.small),
          large: theme(spruce.font.size.medium),
        }
      },
      layer: {
        background: {
          color: rgba(113, 113, 122, 0.33)
        }
      },
      paper: {
        background: {
          color: theme(spruce.color.neutral0)
        },
        shadow: theme(spruce.shadow.medium)
      },
      panel: {
        border: {
          color: theme(spruce.color.neutral200),
          width: 1.px()
        },
        background: {
          color: theme(spruce.color.neutral0)
        }
      }
    }
  });
}
