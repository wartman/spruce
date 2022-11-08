import js.Browser;
import pine.*;
import pine.html.*;
import pine.html.dom.DomBootstrap;
import spruce.animation.*;
import spruce.core.Box;
import spruce.core.PortalContext;
import spruce.button.Button;
import spruce.modal.*;
import spruce.sidebar.*;
import spruce.collapse.*;
import spruce.grid.*;
import spruce.dropdown.*;
import spruce.menu.*;
import spruce.tab.*;
import spruce.layer.LayerContext;
import spruce.accordian.Accordian;

using Nuke;

function main() {
  Spruce.useBaseStyles();
  Spruce.useDefaultColors();
  Spruce.useDarkMode();

  Theme.global({
    spruce: {
      font: {
        family: 'system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", "Noto Sans", "Liberation Sans", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"'
      },
      focus: {
        ring: [ 3.px(), 'solid', theme(spruce.color.primary) ],
        offset: 1.px()
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
          bgColor: theme(spruce.color.primary),
          color: theme(spruce.color.light)
        },
        secondary: {
          bgColor: 'transparent',
          border: [ 1.px(), 'solid', theme(spruce.color.secondary) ]
        },
        info: {
          bgColor: theme(spruce.color.info),
          color: theme(spruce.color.dark)
        },
        warning: {
          bgColor: theme(spruce.color.warning),
          color: theme(spruce.color.dark)
        },
        // etc
      },
      spinner: {
        track: {
          width: .25.em(), 
          color: theme(spruce.color.dark)
        },
        indicator: {
          color: theme(spruce.color.info)
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
          radius: .25.rem()
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
          radius: theme(spruce.rounded.border.radius)
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
        yGap: theme(spruce.grid.gap),
        xGap: theme(spruce.grid.gap) * .5
      },
      card: {
        border: {
          appearance: theme(spruce.priority.secondary.border),
          radius: theme(spruce.rounded.border.radius)
        },
        padding: {
          y: 1.rem(),
          x: 1.rem()
        },
        shadow: [ 0, 0, 0, 1.px(), theme(spruce.color.secondary) ]
      },
      dropdownMenu: {
        bgColor: theme(spruce.color.light),
        color: theme(spruce.color.dark),
        margin: .25.em(),
        border: {
          appearance: theme(spruce.priority.secondary.border),
          radius: theme(spruce.rounded.border.radius)
        },
        padding: {
          x: theme(spruce.rounded.padding.x),
          y: theme(spruce.rounded.padding.y)
        },
        hilightBgColor: rgba(0,0,0,0.2),
      },
      paper: {
        bgColor: theme(spruce.color.light),
        color: theme(spruce.color.dark),
        border: {
          // appearance: theme(spruce.priority.secondary.border),
          radius: theme(spruce.rounded.border.radius)
        },
        shadow: [ 0.px(), 0.px(), 10.px(), rgba(0, 0, 0, 0.5) ],
        padding: {
          x: theme(spruce.rounded.padding.x),
          y: theme(spruce.rounded.padding.y)
        },
      },
      tab: {
        nav: {
          button: {
            padding: {
              y: 1.rem(),
              x: 1.rem()
            },
            color: {
              active: theme(spruce.color.primary)
            }
          }
        }
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
        new ShowSidebar({}),
        new Grid<4>({
          children: [
            new GridColumn<1>({
              children: [
                new Collapse({
                  styles: [
                    Css.atoms({
                      background: 'red'
                    })
                  ],
                  children: [
                    new CollapseHeader({
                      child: 'Test'
                    }),
                    new CollapseBody({
                      children: new Html<'p'>({
                        children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.'
                      })
                    })
                  ]
                })
              ]
            }),
            new GridColumn<2>({
              children: [
                new DropdownButton({
                  label: 'A dropdown!',
                  child: new DropdownMenu({
                    children: [
                      new MenuItem({ 
                        child: new DropdownMenuLink({
                          kind: Action(() -> trace('bar')),
                          child: 'Bar!'
                        }) 
                      }),
                      new MenuItem({ 
                        child: new DropdownMenuLink({
                          kind: Action(() -> trace('foop')),
                          child: 'Foober!'
                        }) 
                      }),
                      new MenuItem({ 
                        child: new DropdownMenuLink({
                          kind: Action(() -> trace('foop')),
                          child: 'Flop!'
                        }) 
                      }),
                      new MenuItem({ 
                        child: new DropdownMenuLink({
                          kind: Action(() -> trace('foop')),
                          child: 'Frodge!'
                        }) 
                      })
                    ]
                  })
                }),
                new TabExample({})
              ]
            }),
            new GridColumn<1>({
              children: [
                new Accordian({
                  children: [
                    // new CardHeader({
                    //   children: [
                    //     new Heading({
                    //       level: 5,
                    //       children: 'Accordian Example'
                    //     })
                    //   ]
                    // }),
                    new Collapse({
                      children: [
                        new CollapseHeader({
                          child: 'One' 
                        }),
                        new CollapseBody({
                          children: new Html<'p'>({ 
                            children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                          })
                        }),
                      ]
                    }),
                    new Collapse({
                      children: [
                        new CollapseHeader({
                          child: 'Two' 
                        }),
                        new CollapseBody({
                          children: new Html<'p'>({ 
                            children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                          })
                        }),
                      ]
                    }),
                    new Collapse({
                      children: [
                        new CollapseHeader({
                          child: 'Three' 
                        }),
                        new CollapseBody({
                          children: new Html<'p'>({ 
                            children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                          })
                        }),
                      ]
                    }),
                    new Collapse({
                      children: [
                        new CollapseHeader({
                          child: 'Four' 
                        }),
                        new CollapseBody({
                          children: new Html<'p'>({ 
                            children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                          })
                        }),
                      ]
                    }),
                  ]
                })
              ]
            })
          ]
        })
      ]
    });
  }
}

class Toggle extends ObserverComponent {
  @track var toggle:Bool = false;

  function render(context:Context) {
    return new Fragment({
      children: [
        new Animated({
          createKeyframes: switch toggle {
            case true: _ -> [
              { opacity: 1, width: 100.vw() },
              { opacity: 0, width: 0 }
            ];
            case false: _ -> [
              { opacity: 0, width: 0 },
              { opacity: 1, width: 100.vw() }
            ];
          },
          duration: 300,
          onFinished: context -> {
            // @todo: maybe automatically apply these styles
            // as a part of the Animate component?
            var el:js.html.Element = context.getObject();
            el.style.opacity = toggle ? '0' : '1';
            el.style.width = toggle ? '0' : 100.vw();
          },
          child: new Box({
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

class TabExample extends ImmutableComponent {
  function render(context:Context) {
    return new TabGroup({
      tabs: [
        new Tab({
          label: 'One',
          child: 'Hello World'
        }),
        new Tab({
          label: 'Two',
          child: 'Hello Other World'
        })
      ]
    });  
  }
}
