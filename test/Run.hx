import eg.Keyframes;
import js.Browser;
import pine.*;
import pine.html.*;
import pine.html.client.ClientRoot;
import eg.Animated;
import eg.LayerContext;
import spruce.layout.*;
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
import spruce.nav.*;
import spruce.typography.*;
import spruce.accordian.Accordian;

using Nuke;

function main() {
  Spruce.useBaseStyles();
  Spruce.useLightColors();
  Spruce.useDefaultTheme();

  ClientRoot.mount(
    Browser.document.getElementById('root'),
    new PortalContextProvider({
      create: () -> new PortalContext(Browser.document.getElementById('portal')),
      dispose: _ -> null,
      render: _ -> new App({})
    })
  );
}

class App extends AutoComponent {
  function render(context:Context) {
    var box = new Box({
      layout: Vertical,
      spacing: Large,
      children: [
        new Toggle({}),
        new Box({
          layout: Horizontal,
          spacing: Small,
          children: [
            new ShowModal({}),
            new ShowSidebar({})
          ]
        }),
        new Grid<4>({
          children: [
            new GridColumn<4, 'md:1'>({
              children: [
                new Collapse({
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
            new GridColumn<4, 'md:2'>({
              children: [
                new Dropdown({
                  toggle: new DropdownButton({
                    child: 'A dropdown!'
                  }),
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
            new GridColumn<4, 'md:1'>({
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
                      borderRadius: Large,
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

    var nav = new Navbar({
      spacing: Small,
      styles: Css.atoms({
        backgroundColor: theme(spruce.color.neutral900),
        color: theme(spruce.color.neutral0),
      }),
      children: [
        new NavbarMobile({
          children: 'test'
        }),
        new NavbarBrand({
          child: new Heading({
            level: 2,
            children: 'Test'
          })
        })
      ]
    });

    var body = new Container({
      kind: Lg,
      children: box
    });

    return new Fragment({
      children: [
        nav,
        body
      ]
    });
  }
}

class Toggle extends AutoComponent {
  var toggle:Bool = false;

  function render(context:Context) {
    return new Box({
      styles: [
        Css.atoms({ 
          width: 100.pct(),
          overflow: ' '
        })
      ],
      layout: Vertical,
      spacing: Small,
      children: [
        new Animated({
          keyframes: switch toggle {
            case true: new Keyframes('in', _ -> [
              { opacity: 1, width: 100.pct() },
              { opacity: 0, width: 0 }
            ]);
            case false: new Keyframes('out', _ -> [
              { opacity: 0, width: 0 },
              { opacity: 1, width: 100.pct() }
            ]);
          },
          duration: 300,
          onFinished: context -> {
            // @todo: maybe automatically apply these styles
            // as a part of the Animate component?
            var el:js.html.Element = context.getObject();
            el.style.opacity = toggle ? '0' : '1';
            el.style.width = toggle ? '0' : 100.pct();
          },
          child: new Box({
            styles: Css.atoms({
              width: 200.px(),
              height: 200.px(),
              background: 'black'
            })
          })
        }),
        new Box({
          children: [
            new Button({
              onClick: _ -> toggle = !toggle,
              children: [ 'Flip' ]
            })
          ]
        })
      ]
    });
  }
}

class ShowModal extends AutoComponent {
  var isOpen:Bool = false;

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

class ShowSidebar extends AutoComponent {
  var isOpen:Bool = false;

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
          borderRadius: Pill,
          onClick: _ -> isOpen = true,
          children: [ 'Sidebar' ]
        }),
        sidebar
      ]
    });
  }
}

class TabExample extends AutoComponent {
  var variant:TabVariant = Underline;

  function render(context:Context) {
    var tabs = new TabGroup({
      variant: variant,
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

    var dropdown = new Dropdown({
      toggle: new DropdownButton({
        child: switch variant {
          case Underline: 'Underline';
          case Pill: 'Pill';
          default: 'Wtf';
        }
      }),
      child: new DropdownMenu({
        children: [
          new MenuItem({
            child: new DropdownMenuLink({
              kind: Action(() -> variant = Underline),
              child: 'Underline'
            })
          }),
          new MenuItem({
            child: new DropdownMenuLink({
              kind: Action(() -> variant = Pill),
              child: 'Pill'
            })
          })
        ]
      })
    });

    return new Box({
      key: 'this one',
      spacing: Medium,
      layout: Vertical,
      children: [
        new Box({
          children: [
            dropdown
          ]
        }),
        tabs
      ]
    });
  }
}
