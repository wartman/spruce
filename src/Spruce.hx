using Nuke;

// @todo: Stealing from this, mostly: 
// https://github.com/twbs/bootstrap/blob/main/dist/css/bootstrap-reboot.css
function useBaseStyles() {
  Css.global({
    '*, *::before, *::after': {
      boxSizing: 'border-box'
    },
    body: {
      margin: 0,
      fontFamily: theme(spruce.font.family),
      fontSize: theme(spruce.font.size, 1.rem()),
      fontWeight: theme(spruce.font.weight, 400),
      lineHeight: theme(spruce.font.lineHeight, 1.5),
      color: theme(spruce.font.color),
      backgroundColor: theme(spruce.body.bgColor)
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

function useDefaultTheme() {
  Theme.global({
    spruce: {
      // todo
    }
  });
}

function useDefaultColors() {
  Theme.global({
    spruce: {
      color: {
        // Stolen from bootstrap atm
        primary: rgb(13, 110, 253),
        secondary: rgb(108, 117, 125),
        success: rgb(25,135,84),
        info: rgb(13,202,240),
        warning: rgb(255,193,7),
        danger: rgb(220,53,69),
        light: rgb(248,249,250),
        dark: rgb(33,37,41),
        scrim: rgba(0,0,0,0.7)
      },
      colorTheme: {
        primary: {
          bgColor: theme(spruce.color.primary),
          color: theme(spruce.color.light)
        },
        secondary: {
          bgColor: theme(spruce.color.secondary),
          color: theme(spruce.color.light)
        },
        info: {
          bgColor: theme(spruce.color.info),
          color: theme(spruce.color.light)
        },
        warning: {
          bgColor: theme(spruce.color.warning),
          color: theme(spruce.color.light)
        },
        danger: {
          bgColor: theme(spruce.color.danger),
          color: theme(spruce.color.light)
        },
        light: {
          bgColor: theme(spruce.color.light),
          color: theme(spruce.color.dark)
        },
        dark: {
          bgColor: theme(spruce.color.dark),
          color: theme(spruce.color.light)
        }
      }
    }
  });
}

function useDarkMode() {
  Theme.mediaQuery({ type: 'screen', prefersColorScheme: 'dark' }, {
    spruce: {
      color: {
        // Stolen from bootstrap atm
        primary: rgb(13, 110, 253),
        secondary: rgb(108, 117, 125),
        success: rgb(25,135,84),
        info: rgb(13,202,240),
        warning: rgb(255,193,7),
        danger: rgb(220,53,69),
        light: rgb(248,249,250),
        dark: rgb(33,37,41),
        scrim: rgba(0,0,0,0.7)
      }
    }
  });
}
