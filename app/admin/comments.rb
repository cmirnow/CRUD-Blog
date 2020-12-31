ActiveAdmin.register Comment do
   permit_params :commenter, :body, :post_id
end
