import js.Browser;
import pine.*;
import pine.html.*;
import pine.html.dom.DomBootstrap;
import seed.*;
import seed.Sidebar;
import seed.PortalContext;
import seed.style.Breakpoint;

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
        }
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
    render: _ -> render()
  }));
}

function render() {
  return new Fragment({
    children: [
      new SiteHeader({
        items: [
          new MenuItem({ 
            child: new MenuLink({
              kind: Action(() -> trace('foo')),
              child: 'Foo!'
            })
          }),
          new MenuItem({ 
            child: new MenuLink({
              kind: Action(() -> trace('bar')),
              child: 'Bar!'
            })
          })
        ]
      }),
      new Container({
        kind: Lg,
        styles: Css.atoms({ marginTop: theme(seed.grid.yGap) }),
        children: [
          new Grid<4>({
            // @todo: Should `width: 100.pct()` be the default?
            styles: Css.atoms({ width: 100.pct() }),
            children: [
              new GridColumn<4, 'md:2', 'lg:3'>({
                children: [
                  new Html<'p'>({ children: 'Some text' }),
                  new Spinner({}),
                  new ShowModal({})
                ]
              }),
              new GridColumn<4, 'md:2', 'lg:1'>({
                children: [
                  new Html<'p'>({ children: 'Another column' })
                ]
              }),
              new GridColumn<4, 'md:2'>({
                children: [
                  new Box({
                    layout: Vertical,
                    children: [
                      new Card({
                        children: [
                          new CardHeader({
                            priority: Primary,
                            children: [
                              new Heading({
                                level: 5,
                                children: 'Card Example'
                              })
                            ]
                          }),
                          new CardBody({
                            children: [
                              new Html<'p'>({ children: [ 'Hey world' ] }),
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
                                    })
                                  ]
                                })
                              })
                            ]
                          })
                        ]
                      }),
                      new Collapse({
                        children: [
                          new CollapseHeader({
                            child: 'Some Collapsed Thingie' 
                          }),
                          new CollapseBody({
                            children: new Html<'p'>({ 
                              children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                            })
                          }),
                        ]
                      }),

                      new Accordian({
                        children: [
                          new CardHeader({
                            children: [
                              new Heading({
                                level: 5,
                                children: 'Accordian Example'
                              })
                            ]
                          }),
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
                      }),

                      // Shows how to make Accordian sticky:
                      new Accordian({
                        sticky: true,
                        children: [
                          new Heading({
                            level: 5,
                            children: 'Configurable Accordian Example'
                          }),
                          new Scope({
                            render: context -> new Box({
                              layout: Horizontal,
                              children: [
                                new Button({
                                  onClick: _ -> AccordianContext.from(context).hideAll(),
                                  children: 'Hide'
                                }),
                                new Isolate({
                                  wrap: _ -> new Button({
                                    onClick: _ -> AccordianContext.from(context).toggleSticky(),
                                    children: if (AccordianContext.from(context).isSticky)
                                      'Unstick'
                                    else
                                      'Stick'
                                  })
                                })
                              ]
                            })
                          }),
                          new Box({
                            styles: Css.atoms({
                              gap: theme(seed.grid.gap)
                            }),
                            layout: Vertical,
                            children: [   
                              new AccordianItem({
                                label: 'One',
                                children: new Html<'p'>({ 
                                  children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                                })
                              }),
                              new AccordianItem({
                                label: 'Two',
                                children: new Html<'p'>({ 
                                  children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                                })
                              }),
                              new AccordianItem({
                                label: 'three',
                                children: new Html<'p'>({ 
                                  children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                                })
                              }),
                              new AccordianItem({
                                label: 'four',
                                children: new Html<'p'>({ 
                                  children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                                })
                              }),
                            ]
                          })
                        ]
                      })

                    ]
                  })
                ]
              }),

              new GridColumn<4, 'md:2'>({
                children: [
                  new TabGroup({
                    tabs: [
                      { label: ('Foo':HtmlChild), render: context -> ('Hey world':HtmlChild) },
                      { label: ('Bar':HtmlChild), render: context -> ('Bye world':HtmlChild) },
                    ]
                  })
                ]
              })
            ]
          })
        ]
      }),

      new Footer({
        children: 'Test'
      })
    ]
  });
}

class ShowModal extends ObserverComponent {
  @track var isOpen:Bool = false;

  public function render(context:Context) {
    return new Fragment({
      children: [
        new Button({
          priority: Primary,
          onClick: _ -> isOpen = true,
          children: [ 'Click me' ]
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
                    onClick: _ -> OverlayContext.from(context).hide(),
                    priority: Primary,
                    children: [ 'Ok' ]
                  }),
                  new Button({
                    onClick: _ -> OverlayContext.from(context).hide(),
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

class SiteHeader extends ObserverComponent {
  @prop final items:Array<Component>;
  @track var isOpen:Bool = false;

  function render(context:Context) {
    return new Navbar({
      tag: Header,
      styles: Theme.define({
        seed: {
          navbar: {
            bgColor: theme(seed.color.primary),
            color: theme(seed.color.light)
          }
        }
      }),
      children: [   
        new ControlGroup({
          styles: Breakpoint.md({ display: [ 'none', '!important' ] }),
          controls: [
            new ControlButton({
              onClick: _ -> isOpen = true,
              ariaLabel: 'Toggle Menu',
              child: new Icon({
                styles: Css.atoms({ width: 2.em(), height: 2.em() }),
                kind: Hamburger 
              })
            })
          ]
        }),
        new NavbarBrand({ 
          styles: Css.atoms({ flexGrow: 3 }), 
          child: new Html<'h1'>({ children: [ 'Test' ] }) 
        }),
        new NavbarMenu({
          styles: [
            Css.atoms({ display: 'none' }),
            Breakpoint.md({ display: 'flex' })
          ],
          children: items
        }),
        if (isOpen)
          new Sidebar({
            attachment: Left,
            onHide: () -> isOpen = false,
            children: [
              new SidebarHeader({
                child: new SidebarTitle({ child: 'Main Menu' })
              }),
              new SidebarBody({
                children: [
                  new Menu({
                    layout: Vertical,
                    children: items
                  })
                ]
              })
            ]
          })
        else
          null
      ]
    });
  }
}

class AccordianItem extends ImmutableComponent {
  @prop final label:String;
  @prop final children:HtmlChildren;

  function render(context:Context) {
    return new Collapse({
      styles: [
        Card.baseStyle,
        Priority.Secondary.toStyle()
      ],
      children: [
        new CollapseHeader({
          styles: [
            Css.atoms({ 
              alignItems: 'center',
            }),
            CardHeader.baseStyles
          ],
          child: label
        }),
        new CollapseBody({
          children: new Box({
            styles: [
              Css.atoms({
                borderTop: [ 1.px(), 'solid', theme(seed.color.secondary) ],
                padding: [ theme(seed.card.padding.y), theme(seed.card.padding.x) ]
              })
            ],
            children: children 
          })
        })
      ] 
    });
  }
}
