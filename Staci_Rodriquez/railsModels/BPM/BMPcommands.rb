1. know how to retrieve all posts for the first blog.
    Blog.first.posts

2. know how to retrieve all posts for the last blog (sorted by title in the DESC order).
    Blog.last.posts.order(title: :desc)

3. know how to update the first post's title.
    post = Post.first
    post.title = 'new title'
    post.save

4. know how to delete the third post (have the model automatically delete all messages associated with the third post when you delete the third post).
    in models:
        has_many :items , dependent: :destroy
    in console:
        Post.third.destroy

5. know how to retrieve all blogs.
    Blog.all
6. know how to retrieve all blogs whose id is less than 5.
    Blog.where('id<5')