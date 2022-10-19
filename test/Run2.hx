import js.Browser;
import pine.*;
import pine.html.dom.DomBootstrap;
import seed2.animation.*;
import seed2.core.Box;
import seed2.core.PortalContext;
import seed2.button.Button;
import seed2.modal.*;
import seed2.sidebar.*;
import seed2.layer.LayerContext;

using Nuke;

function main() {
  Seed.useBaseStyles();

  // @todo: (for Nuke) we need a way to scope Theme with
  // media queries.
  Theme.global({
    seed: {
      font: {
        family: 'system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", "Noto Sans", "Liberation Sans", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"'
      },
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
      priority: {
        primary: {
          bgColor: theme(seed.color.primary),
          color: theme(seed.color.light)
        },
        secondary: {
          bgColor: 'transparent',
          border: [ 1.px(), 'solid', theme(seed.color.secondary) ]
        },
        info: {
          bgColor: theme(seed.color.info),
          color: theme(seed.color.dark)
        },
        warning: {
          bgColor: theme(seed.color.warning),
          color: theme(seed.color.dark)
        },
        // etc
      },
      spinner: {
        track: {
          width: .25.em(), 
          color: theme(seed.color.dark)
        },
        indicator: {
          color: theme(seed.color.info)
        }
      },
      box: {
        padding: {
          y: .5.rem(),
          x: .75.rem()
        },
      },
      rounded: {
        border: {
          radius: .75.rem()
        },
        padding: {
          y: .75.rem(),
          x: 1.rem()
        }
      },
      modal: {
        border: {
          radius: .75.rem()
        },
        padding: {
          y: .75.rem(),
          x: 1.rem()
        }
      },
      button: {
        border: {
          radius: theme(seed.rounded.border.radius)
        },
        padding: {
          y: .50.rem(),
          x: .75.rem()
        }
      },
      container: {
        padding: {
          x: 2.rem()
        }
      },
      grid: {
        gap: 1.5.rem(),
        yGap: theme(seed.grid.gap),
        xGap: theme(seed.grid.gap) * .5
      },
      card: {
        border: {
          appearance: theme(seed.priority.secondary.border),
          radius: theme(seed.rounded.border.radius)
        },
        padding: {
          y: 1.rem(),
          x: 1.rem()
        },
        shadow: [ 0, 0, 0, 1.px(), theme(seed.color.secondary) ]
      },
      dropdownMenu: {
        bgColor: theme(seed.color.light),
        color: theme(seed.color.dark),
        margin: .25.em(),
        border: {
          appearance: theme(seed.priority.secondary.border),
          radius: theme(seed.rounded.border.radius)
        },
        padding: {
          x: theme(seed.rounded.padding.x),
          y: theme(seed.rounded.padding.y)
        },
        hilightBgColor: rgba(0,0,0,0.2),
      }
    }
  });

  var boot = new DomBootstrap(Browser.document.getElementById('root'));
  boot.mount(new PortalContextProvider({
    create: () -> new PortalContext(Browser.document.getElementById('portal')),
    dispose: _ -> null,
    render: _ -> new App({})
  }));
}

class App extends ImmutableComponent {
  function render(context:Context) {
    return new Fragment({
      children: [
        new Toggle({}),
        new ShowModal({}),
        new ShowSidebar({})
      ]
    });
  }
}

class Toggle extends ObserverComponent {
  static final transition:TransitionGroup = [
    {
      property: 'opacity',
      start: '1',
      end: '0'
    },
    {
      property: 'width',
      start: '300px',
      end: '100px'
    }
  ];

  @track var toggle:Bool = false;

  function render(context:Context) {
    return new Fragment({
      children: [
        new Transition({
          transitions: toggle ? transition : transition.invert(),
          speed: 500,
          onTransition: () -> trace('changed'),
          render: () -> new Box({
            styles: Css.atoms({
              width: 200.px(),
              height: 200.px(),
              background: 'black'
            })
          })
        }),
        new Button({
          onClick: _ -> toggle = !toggle,
          children: [ 'Flip' ]
        })
      ]
    });
  }
}

class ShowModal extends ObserverComponent {
  @track var isOpen:Bool = false;

  public function render(context:Context) {
    return new Fragment({
      children: [
        new Button({
          priority: Primary,
          onClick: _ -> isOpen = true,
          children: [ 'Modal' ]
        }),
        if (isOpen) new Modal({
          onHide: () -> isOpen = false,
          children: [
            new ModalHeader({ 
              priority: Warning,
              child: new ModalTitle({ child: 'Test' }) 
            }),
            new ModalBody({ children: [ 'This should work' ] }),
            new Scope({
              render: context -> new ModalFooter({
                children: [
                  new Button({
                    onClick: _ -> LayerContext.from(context).hide(),
                    priority: Primary,
                    children: [ 'Ok' ]
                  }),
                  new Button({
                    onClick: _ -> LayerContext.from(context).hide(),
                    priority: Secondary,
                    children: [ 'Cancel' ]
                  }),
                ]
              })
            })
          ]
        }) else null
      ] 
    });
  }
}

class ShowSidebar extends ObserverComponent {
  @track var isOpen:Bool = false;

  function render(context:Context) {
    var sidebar = if (isOpen)
      new Sidebar({
        attachment: Right,
        onHide: () -> isOpen = false,
        children: [
          new SidebarHeader({
            child: new SidebarTitle({ child: 'Main Menu' })
          }),
          new SidebarBody({
            children: [ 'hey world' ]
          })
        ]
      })
    else
      null;

    return new Fragment({
      children: [
        new Button({
          priority: Primary,
          onClick: _ -> isOpen = true,
          children: [ 'Sidebar' ]
        }),
        sidebar
      ]
    });
  }
}
