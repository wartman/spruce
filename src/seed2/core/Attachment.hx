package seed2.core;

typedef Attachment = {
  public final h:AttachmentHorizontal;
  public final v:AttachmentVertical;
}

enum AttachmentVertical {
  Top;
  Bottom;
  Middle;
}

enum AttachmentHorizontal {
  Left;
  Right;
  Middle;
}
