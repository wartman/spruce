import seed.style.Breakpoint;

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
      fontFamily: theme(seed.font.family),
      fontSize: theme(seed.font.size, 1.rem()),
      fontWeight: theme(seed.font.weight, 400),
      lineHeight: theme(seed.font.lineHeight, 1.5),
      color: theme(seed.font.color),
      backgroundColor: theme(seed.body.bgColor)
    },
    'h6, h5, h4, h3, h2, h1': {
      fontFamily: theme(seed.heading.font.family),
      marginTop: 0,
      marginBottom: .5.rem(),
      fontWeight: 500,
      lineHeight: 1.2,
      color: theme(seed.heading.color)
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
    seed: {
      // todo
    }
  });
}

function useDefaultColors() {
  Theme.global({
    seed: {
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
          bgColor: theme(seed.color.primary),
          color: theme(seed.color.light)
        },
        secondary: {
          bgColor: theme(seed.color.secondary),
          color: theme(seed.color.light)
        },
        info: {
          bgColor: theme(seed.color.info),
          color: theme(seed.color.light)
        },
        warning: {
          bgColor: theme(seed.color.warning),
          color: theme(seed.color.light)
        },
        danger: {
          bgColor: theme(seed.color.danger),
          color: theme(seed.color.light)
        },
        light: {
          bgColor: theme(seed.color.light),
          color: theme(seed.color.dark)
        },
        dark: {
          bgColor: theme(seed.color.dark),
          color: theme(seed.color.light)
        }
      }
    }
  });
}

function useDarkMode() {
  // @todo: Nuke doesn't support scoping themes yet.
}
