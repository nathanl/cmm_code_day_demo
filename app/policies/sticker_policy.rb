class StickerPolicy < ApplicationPolicy

  allow_access_for_roles(
    create:     %w[default],
    index:      %w[default],
    new:        %w[default],
    show:       %w[default],
    update:     %w[superuser],
  )

end
