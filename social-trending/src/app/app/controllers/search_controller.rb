require 'json'
require 'mime/types'
require 'open-uri'

class SearchController < ApplicationController
    @req_time = DateTime.current #initialize the moment when the request was initiated.

        def index
        
        end
        def show
            self.srch
        end        

        def srch

                # actual api calls for search go here...
@session_id =  request.headers["rack.session"]["session_id"]
@search_string = params["message"]
                @hash_for_view = {}
				@hash_for_see = {}
                #@master_list = ['iphone','adored','afraid' ,'aggravated','agitated' ,'agonized','alienated','amazed' ,'amused','angry','anguished','annoyed' ,'antsy' ,'anxious','apprehensive','ashamed','astonished','attracted','awful','awkward','awesome','Awesome','bashful','best','bewildered','bitter' ,'blissed','bored','brave' ,'beatific','blessed','bereft','bad','backward','calm' ,'caring','cautious','cheerful','comfortable','compassionate','concerned','confident','confused','contempt','critical','cynical','cute' ,'defeated','dejected','delighted','depressed','desired'	,'disappointed','discouraged','disgusted','difficulty'	,'disliked','dismayed'	,'distressed','disturbed' ,'dizzare','down','dreadful','eager'	,'ecstatic','edgy','elated','embarrassed','encouraged','enraged'	,'enthralled','enthused','envious'	,'euphoric','exasperated','excited','exhausted','exhilarated','fatigued','fearful','ferocious','fidgety','fond','fuck','frightened','frustrated','funny','furious','good','glad','gleeful','gloomy','greedy','griefstricken' ,'grouchy','grumpy','guilty','happy','hassled','hateful','helpless','hesitant','homesick','hopeful','hopeless','horrible','hostile' ,'humiliated','hurt'	,'hysterical','impatient','indifferent','infatuated','inferior','insecure','insulted','irate'	,'irked'	,'irritated','isolated','jealous','jittery','jolly'	,'joyous','jaded'	,'jarred','jaunty' ,'joyful' ,'joyless','lazy'	,'leery'	,'like','Like','Brilliant','most','Affordable','loathe','lol' ,'lonely','love'	,'loving','lamentful','languid','lavish','mad'	,'mean' ,'meanness' ,'melancholical','mischievous','miserable','moody' ,'mortified','neglected','nervous' ,'fantastic','nice','negotiate' ,'negative','null', 'nutty' ,'normal' ,'nervous' ,'new'  ,'narrow'  ,'nothing' ,'optimistic','outraged','overwhelmed','panicky' ,'passionate','pleased' ,'proud' ,'peaceful','perfect','powerful','poor'  ,'pleasure','polite' ,'poorly' ,'powerless','precious','pure'  ,'queasy' ,'rage','rapture','regret','reject','relieve','reluctant','remorse','resent','restless','ridiculous','riled','sale',	'sad'	,'safe'	,'satisfied','scared','secure','screwed' ,'sensitive'	,'shaky'	,'shocked','shy'	,'silly'	,'sleepy','sorry'	,'spiteful','shit','suck'	,'stressed','surprised'	,'suspicious','sympathetic','tender','tense'	,'terrified'	,'thrilled','tired','tormented'	,'triumphant','troubled'	,'uncomfortable'	,'uneasy','unhappy','unsafe','unsettled','upset'	,'vengeful','vicious','victorious','win','wow','warm','weary','woeful','wonderful'	,'worried','wrathful','yucky'	,'yippy'	,'zany'	,'zealless','zestless','Congrats','Damn','support','contrast']
                #client = TwitterOAuth::Client.new
                @emo = { 'ybs'=>-3.0,'wts'=>-4.3,'wth'=>-4.2,'wtf'=>-4.5,'xoxo'=>+2.0,'weg'=>-2.5,'stfu'=>-4.2,'ssdd'=>-2.4,'sry'=>-1.5,'sos'=>-2.6,'rofl'=>+3.0,'roflmao'=>+4.0,'roflpmp'=>+3.6,'pita'=>-3.7,'omg'=>0.0,'oic'=>0.0,'nfw'=>-1.6,'nfl'=>-1.4,'nyc'=>-0.5,'mwa'=>+0.4,'lyk'=>+0.8,'lol'=>+2.7,'lmao'=>+3.0,'lmfao'=>+2.0,'hfs'=>-3.9,'h&k'=>+0.5,'fts'=>-4.6,'eg'=>-2.0,'bfd'=>-2.7,'amf'=>-2.4,'anger' => - 5.6,'favour'=> 4.7,'los' => -5.0,'lead' => 2.2,'save' => 2.2,'terrafic' => 4.6,'suffer' => -4.5,'live'=> 6.2, 'pain' => -4.2,'interest'=> 6.2,'luck'=> 5.2,'gracious'=> 4.4,'raise' =>6.6,'kill' => -4,'power' => 4.5,'shock' => -4.6,'trust' => 1.6 ,'blunder' => -5.3,'intellect' => 2.4,'fear'=> -4.9,'fresh' => 4.2, 'blew' => -3.0,'laugh'=> 4.2,'detain' => -3.2,'kidnap' => -5.2,'problem' => -3.2,'coward' => -6.4,'smart' => 6.0,'confiden'=> 6.5,'ignor' => -4.5,'broke' => -3.5,'stink'=> -4,'gud'=> 9.0,'fine'=> 6.0,'dumb'=> -5.0,'crap'=> -8.0,'shit'=> -9.0,'fuck'=> -9.0,'hell'=> -7.0,'bloody'=> -5.0,'insane'=> -6.0,'nuisance'=> -5.5,'worthless'=> -4.0,'yeah'	=> 6.0,'hit' => -4, 'yippie'=> 8.0 ,'ergg'	=> -8.0,'shutup'=> -4.0,'shit'	=> -8.0,'grr'=> -8.5,'pissed'=> -9.5,'pissoff'=> -7.0,'bravo'=> 6.0,'sweet'=> 8.0,'ridiculous'=> -7.0,'disgusting'=> -8.0,'frustrating'=> -8.0,'frustrated'=> -7.0,'depressing'=> -6.0,'depressed'=> -6.0,'idiotic'=> -7.0,'stupid'=> -5.0,'bastard'=> -5.0,'moron'=> -5.0,'cool'=> 7.0,'gr8'=> 8.0,'great'=> 9.0,'mindblowing'=> 9.0, 'fab'=> 9.0,'super'=> 10.0,'extreme'=> 6.0,'full on'=> 5.0,'nonsense'=> -6.0,'rascal'=> -4.0,'eureka'=> 7.5,'hmm'=> 3.0,'fantabulous'=> 8.0,'terrific'=> 6.0,'sucks'=> -8.0,'kudos'=> 8.0,'like'=> 8.0,'beaut' => +3.0,'disaster' => -5.0,'death'=> -5.8,'tackle'=>2.4,'dead'=> -4.4,'terror' => -7.0,'tsunami' => -6.0,'earthquake' => -4.0,'threat'=> -4.6,'adored' => 2.5,'afraid' 	=> -1.6,'cheer'=> 4.4,'shame'=> -5.2,'absolutely'=> 3.6,'appreciate' => 6.5,'evil' => -4.5, 'mistake' => - 5.6,'die' => -6.2,'than' => 7.1,'honour' => 7.3,'kick' => -5.1,'dirt'=> -7,'tension'=> -8, 'cry' => -6.4,'crazy'=> 3.2,'beware'=> -7.2,'bitch' => -6.4, 'poor' => -4.3, 'fool' => -5.6,'aggravated' => -1.9,'agitated' 	=> -2.0,'agonized' 	=> -2.4,'alienated' => -2.3,'amaz' 	=> 2.5,'amused' 	=> 1.6,'angry' 	=> 3.0,'anguished' => -1.5,'annoyed' 	=> -1.8,'antsy' 	=> -2.6,'anxious' 	=> 2.4,'apprehensive' => -1.7 ,'ashamed' 	=> -2.2,'astonished' => 2.5 ,'attracted' => 3.5,'awful' 	=> -3.5,'petition'=> 2.2,'awkward' 	=> -3.2,'awesome'	=> 5.8,'better'=> 4.8,'bashful' 	=> -2.6,'best'      =>4.6,'bewildered' => -1.7,'bitter' 	=> -2.0,'blissed' 	=> 4.0,'bored' 	=> -3.0,'brave' 	=> 2.2,'beatific'	=>6.9,'blessed'	=>3.0,'bereft'	=>5.0,'bad'		=> -4.8,'backward'	=>0.4,'calm' 		=> 1.4,'caring' 	=> 1.5,'cautious' 	=> -1.5,'cheerful' 	=> 3.6,'comfortable' => 2.4,'compassionate' => 1.5,'concerned' => 1.6,'confident' => 3.2,'confused' 	=> -2.4,'contempt' 	=> -3.0,'critical'	=> -3.0,'cynical'	=> -0.7,'cute' 		=> 5.7,'defeated'	=> -3.9,'dejected'	=> -7.0,'difficulty' =>-3.2,'delighted'	=> 6.0,'depressed'=> -5.6,'desired'	=> 2.0,'disappointed'=> -8.6,'discouraged'=> -2.0,'disgusted'	=> -3.1,'disliked'	=> -4.0,'dismayed'	=> -2.9,'distressed'=> 0.8,'disturbed'=> -2.0 ,'dizzare'=> -3.2,'down'		=> -4.3,'dreadful'=> -8.5,'eager'		=> 4.6,'ecstatic'	=> 5.0,'edgy'		=> -3.5,'elated'	=> 5.0,'embarrassed'=> -4.8,'encouraged'=> 5.5,'enraged'	=> -7.8,'enthralled'=> 3.0,'enthused'	=> 1.9,'envious'	=> 7.0,'euphoric'	=> 5.6,'exasperated'=> 4.7,'Brilliant' => 3.2,'most' =>1.5,'Affordable' =>2.6,'excited'	=> 9.0,'exhausted'=> 7.8,'exhilarated'=> -3.6,'fatigued'	=> -2.0,'fearful'	=> -3.8,'ferocious'=> -2.1,'fidgety'	=> -4.6,'fantastic' => 3.5,'fond'		=>3.5,'fuck'		=> -7.4,'frightened'=> -7.0,'frustrated'=> -6.0,'fun'		=> 8.0,'furious'	=>4.6,'good' => 3.0,'glad'		=> 5.8,'glee'	=>4.7,'gloomy'	=>3.0,'greedy'	=> 4.9,'griefstricken'=>2.0 ,'grouchy'	=> -4,'grumpy'	=> -2.5,'guilty'	=> -3.5,'happ'		=>8.9,'hassled'	=> -1.7,'hateful'	=> -6.9,'helpless'	=> -3.0,'hesitant'	=> -9.0,'homesick'	=>0.0,'hopeful'	=> 6.0,'hopeless'	=> -6.0,'horrible'	=>-8.5,'hostile'	=> -7.6 ,'humiliated'=>2.0,'hurt'		=> -4,'hysterical'=> 0.0,'impatient'	=> -3.5,'indifferent'=> -5.3,'infatuated'=> -3.7,'inferior'	=> -4.8,'insecure'	=> -2.0,'insulted'	=> -6.3,'irate'		=> -9.7,'irked'		=> -1.3,'irritated'	=> -2.6,'isolated'	=>1.3,'jealous'	=> -4.8,'jittery'	=> -5.5,'jolly'		=> 8.5,'joyous'	=> 9.4,'jaded'		=> 2.4,'jarred'	=> 3.5,'jaunty'	=> 5.8 ,'joyful'	=> 4.7 ,'joyless'	=> -4.7 ,'lazy'		=> -3.7,'leery'		=> 2.6,'like'		=> 0.1,'loathe'	=> -1.9,'lol'        => -1.5,'lonely'	=> -8.0,'love'		=> 5.0,'loving'	=> 5.1,'lamentful'	=> -1.5,'languid'	=>0.9,'lavish'	=> 3.7,'mad'		=> -7.4,'mean'      => -2.4,'meanness'  =>3.9,'melancholical'=>0.0,'mischievous'=> -3.5,'miserable' => -4.8,'moody'     =>1.3,'mortified' => -1.7,'neglected' => -4.6,'nervous'   => -5.8,'nice'      => 8.0,'negotiate' => -2.5,'negative'  => -3.5,'null'      => -1.6,'nutty'     =>-4.6,'normal'    => 4.8,'nervous'   => -5.8,'new'       =>7.0,'narrow'    => -4.7,'nothing'   => -3.7,'optimistic'=> 9.0,'outraged'  => 5.7,'overwhelmed'=> 3.0,'panicky'   =>-4.7,'passionate'=>2.0,'pleased'   => 4.5,'proud'     =>8.0 ,'victory' => 6.6,'peace'  =>4.8,'perfect'   => 5.0,'powerful'  =>7.9,'poor'      => -7.4,'pleasure'  => 6.2,'polite'    => 3.2,'poorly'    => -7.8,'powerless' => -8.9,'precious'  => 4.5,'pure'      =>5.5,'queasy'    => -3.5,'rage'		=> -6.0,'rapture'	=> 5.0,'regret'	=> -7.0,'reject'	=>-6.5,'relieve'	=> 4.6,'reluctant'	=> -4.0,'remorse'	=> -3.0,'resent'	=> -2.5,'restless'	=> -3.0,'ridiculous'	=> -8.0,'riled'		=> -6.0,'sale' => -2.0,'sad'		=> -9.0,'safe'		=> 8.0,'satisfied'	=> 5.0,'scared'	=> -6.0,'secure'	=> 8.0,'screwed'   => -2.0,'sensitive'	=> 0.0,'shaky'		=> -6.0,'shocked'	=> -7.0,'shy'		=> 1.0,'silly'		=> -4.0,'sleepy'	=> 0.0,'sorry'		=> -2.0,'spiteful'	=> -4.0,'shit'		=> -2.5,'suck'		=> -4.6,'stressed'	=> -6.0,'surprised'	=> 0.0,'suspicious'	=> -4.0,'sympathetic'	=> 1.0,'tender'	=> 2.0,'tense'		=> -6.0,'terrified'	=> -5.5,'thrilled'	=> 0.5,'tired'		=> -2.0,'torment'	=> -6,'triumph'	=> 7.0,'trouble'	=> -8.0,'uncomfortable'	=> -6.0,'uneasy'	=> -6.5,'unhappy'	=> -9.0,'unsafe'	=> -8.0,'unsettled'	=> -4.0,'upset'		=> -9.5,'vengeful'	=> -5.0,'vicious'	=> -4.0,'victorious'	=> 8.0,'win' => 2.0,'wow'		=> 3.9,'warm'		=> 6.0,'weary'		=> -4.5,'aware'=> 3.2,'flushout'=> 4.8,'success' => 4.8,'avoid'=> 4.4,'bless' => 3.6,'respect'=> 6.4,'truth'=> 2.6,'honest' => 4.3, 'true'=> 2.6,'destroy' => -6.2,'remov'=> -2.4,'woe'	=> -6.0,'wonder'	=> 8.5,'worried'	=> -7.6,'wrath'	=> -7,'yucky'		=> -8,'yippy'		=> 7.6,'zany'		=> 1,'zealless'	=> -2,'zestless'	=> -7,'dongrats' => 2.2, 'damn' => -3.3,'support' => 1.3,'contrast' => -2.1 }
                @master_list = @emo.keys
			   t = Thread.new { @tw_result = self.twt_search(params["message"]) }

                f = Thread.new { @fb_result = self.fb_search(params["message"]) }

                t.join
                f.join

                render "chsrch"

        end

        def twt_search(q, options={})
               options[:page] ||= 10
                options[:rpp] ||= 2000
                options[:q] = URI.escape(q)
                args = options.map{|k,v| "#{k}=#{v}"}.join('&')
                response = open("http://search.twitter.com/search.json?lang=en#{args}", 'User-Agent' => 'raghav')
                @tw_result = JSON.parse(response.read)

                @hash_for_view = tw_processing(@master_list, @tw_result["results"])

        end

        def fb_search(srch)
                str  = URI.escape(srch)
                response = open('http://graph.facebook.com/search?q=' + str  + '&type=post' + '&limit=200' + '&lang=en_Us' , 'User-Agent' => 'puneet')
                @result=JSON.parse(response.read)

                @hash_for_see = fb_processing(@master_list,@result["data"])
        end


        def tw_processing(master_list, messages)

                hash_for_view ={}

                #puts '=================================' + messages.length.to_s

                messages.length.times do |i|

                        #msgwords = messages[i]["text"].split(/ /)
                        #puts '=======words from the message ======================'
                        #puts msgwords

                        score = get_score(messages[i]["text"])

                        hash_for_view[messages[i]["text"]] = score.to_f
                       # db_insert(messages[i]["text"], score, "Twitter",messages[i]["iso_language_cd"])
                end

                return hash_for_view
        end # of function tw_processing

        def fb_processing(master_list, messages)

                #@result["data"].each do |elem| %>

                #puts '===============' + messages.length.to_s + '==============================================='
                #puts messages.inspect

               hash_for_see ={}

                messages.length.times do |i|

                        #msgwords = messages[i]["text"].split(/ /)
                        #puts '=======words from the message ======================'
                        #puts msgwords


                        if not messages[i]["message"].nil?
                                #puts  '========================' + 'launching scoring for ' + messages[i]["message"]
                                score = get_score(messages[i]["message"])
                                hash_for_see[messages[i]["message"]] = score.to_f
                        end


               #         db_insert(messages[i]["message"], score,'Facebook','en')
                end

                return hash_for_see
        end # of function calc_score


        def get_score (msg)
                score = 0
                  @msg2=msg.downcase

                #puts '========== message received for scoring  ==================='
                #puts msg

                #puts '========== master list  ==================='
                #puts @master_list
                              @master_list.each do |k|
                      msg1=/#{k}\w{0,5}/.match(@msg2)
                      if msg1!=nil


                #@msgwords = msg.downcase.split(/ /)
                #score_words = @msgwords & @master_list # array & will leave only scorable words
                #puts '==========score words ==================='
                #puts score_words

                #if not score_words.nil?
                        #score_words.each do |w|
                                #puts 'word =>' +  w
                                x = @emo[k]
                                		s=@msg2.index(k)
										g=@msg2.slice(s-3,7 )

                                        g.each do|word|
                                       if word == params["message"]
                                       @r=g.index(word)
                                       end
                                 end
                          $ag =  @r
                          case $ag
                          when 0 .. 7
                          score = score.to_f+ x.to_f
	
                          else
                          
                           score = score.to_f + x/2.to_f
	
	                       end
                                #puts 'score'
                                #puts x[0].to_f
                                #puts 'scoring for ' + w + ' = ' + x
                                #score = score.to_f + x.to_f

                        end
                end

                return score
        end


       #def db_insert(textvalue, score, site_name, lang_cd)

               # msg = Msgdata.new

                #(msg_arry["created_at"])

                #msg.profile_image =  msg_arry["profile_image_url"]
                #msg.from_user_id = msg_arry["from_user_id_str"]
                #msg.id_str = msg_arry["id_str"]
                #msg.from_user =  msg_arry["from_user"]
               # msg.message =  textvalue # msg_arry["text"]
                #msg.metadata =  msg_arry["metadataresult_type"]
                #msg.id =  msg_arry["id"]
              #  msg.language_cd =  lang_cd # msg_arry["iso_language_cd"]
                #msg.source_url =  msg_arry["source"]
              #  msg.score= score
               # msg.request_time = @req_time
              #  msg.session_id =  request.headers["rack.session"]["session_id"]
              #  msg.search_string = params["message"]
                #session.session_id
              #  msg.site_name = site_name

              #  msg.save

     #   end # end of db_insert

       
        
        

            
        

end  # end of class

