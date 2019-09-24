import 'dart:async';

import 'package:your_doctor/data/articles/articles_data.dart';

/*var data = <Article>[
  new Article(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/5/2019",
  ),
  new Article(
    id: "2",
    dr_name: "mmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "3",
    dr_name: "mmmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "4",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/5/2019",
  ),
  new Article(
    id: "2",
    dr_name: "mmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "3",
    dr_name: "mmmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "4",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/5/2019",
  ),
  new Article(
    id: "2",
    dr_name: "mmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "3",
    dr_name: "mmmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "4",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/5/2019",
  ),
  new Article(
    id: "2",
    dr_name: "mmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "3",
    dr_name: "mmmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "4",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/5/2019",
  ),
  new Article(
    id: "2",
    dr_name: "mmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "3",
    dr_name: "mmmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "4",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/5/2019",
  ),
  new Article(
    id: "2",
    dr_name: "mmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/www.treasureislandsweets.co.uk\/user\/products\/large\/kitkatdark__25045.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "3",
    dr_name: "mmmmm",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
  new Article(
    id: "4",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    article_title: "how to be stron man ;)",
    article:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    article_img:
        "https:\/\/cdn.tmobile.com\/content\/dam\/t-mobile\/en-p\/cell-phones\/apple\/apple-iphone-xs\/gold\/Apple-iPhoneXs-Gold-1-3x.jpg",
    date: "7/1/2017",
  ),
];*/

//class MockArticlesRepository implements ArticlesRepository {
//  @override
//  Future<List<Article>> fetchArticles() {
//    // TODO: implement fetch Categories
//    return new Future.value(data);
//  }
//}
