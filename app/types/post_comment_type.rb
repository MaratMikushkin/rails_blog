class PostCommentType < Comment
  include ApplicationType

  permit :commenter, :body
end
