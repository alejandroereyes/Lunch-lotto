var Profile = React.createClass({
    render: function () {
        return (
			<div className="profile-section col12">
				<div className="col4 col-on col-off"></div>
				<div className="profile-creation col4">
					<form className="profile-form" id="creation-screen" onSubmit = {this.profile}>
						<ul><li><img src="assets/profilechief" alt=""></img></li></ul>
							<h3>Create a Profile</h3>
							<div>
								<label>
									<span>Your Name:</span>
									<input placeholder="Enter your name" type="text" tabIndex="1" autofocus ref="registerName"/>
								</label>
							</div>
							<div>
								<label>
									<span>Bio</span>
									<textarea name="comments" placeholder="What do you want people to know about you" rows="3" maxLength="200" cols="60" ref="registerBio"></textarea>
								</label>
							</div>
							<div>
								<label>
									<span>Your Network Circle:</span>
										  <select name="Network-Circle" ref="networkCircle">
										    <option value="Creative">Creative</option>
										    <option value="Engineering">Engineering</option>
										    <option value="Design">Design</option>
										    <option value="Product Management">Product Managment</option>
										    <option value="Venture Capitalist">Venture Capitalist</option>
										    <option value="Founder/CEO">Founder/CEO</option>
										  </select>
								</label>
							</div>

							<div className="foodtypes">

								<label>
								<span>Your Favorite Food Types:</span>
								</label>
								<ul>
									<li>
										<input type="checkbox" ref="foodTypes" name="EasyBreezy" id="EB" value="25"/>
						        		<label form="1">
							      		<b>Easy Breezy</b>
								      		<div className="food-box">
								      		<p className="food-description">You have a zest for quick and easy food. Fast food is not a bad word. It can be a positively tasty experience given the right price.
								      		</p> 
								      		<img src="assets/fastfood" alt=""></img>	
								      		</div>			  
						        		</label>
									</li>
									<li>
										<input type="checkbox" name="HealthNut" id="HN" value="25"/>
						        		<label form="2">
							      		<b>Health Nut</b>
								      		<div className="food-box">
								      		<p className="food-description">Eating healthy nutritious meals is a lifestyle you cant ignore. While others may view food as secondary, you see it as a key to improving your overall well being. Heres to good health!
								      		</p>
									      	<img src="assets/healthy1" alt=""></img>	
								      		</div> 
						        		</label>
									</li>
									<li>
								        <input type="checkbox" name="WildChild" id="WC" value="25"/>
								        <label form="3">
									      <b>Wild Child</b>
								      	<div className="food-box">						      
								      		<p className="food-description">You love great food no matter where it takes you. Food Trucks, taco stands, and exotic local cuisines are staples. Nothing is off limits! Where is the next adventure?
								      		</p>
								      		<img src="assets/wildchild" alt=""></img>
							      		</div>				      		 
								        </label>
									</li>
									<li>
								        <input type="checkbox" name="LuxeLunch" id="luxe" value="25"/>
								        <label form="4">
									      <b>Luxe Lunch</b>
					      					<div className="food-box">	
								      		<p className="food-description">The right dining experience is not cheap and your willing to pay the price as long as they provide excellent service and impeccable food! Bon appetite!
								      		</p>
									      	<img src="assets/luxe" alt=""></img>			      		
									      	</div> 
						        		</label>		
									</li>
									<li>
										<input type="checkbox" name="Casual Comfort" id="CSD" value="25"/>
						        		<label form="5">
							      		<b>Casual Comfort</b>
								      		<div className="food-box">	
								      		<p className="food-description">Your always looking for the next place to call home. You love atmosphere and you know sometimes the best things are simply a great coffee or drink at a local joint where everyone knows your name. Cheers!
								      		</p> 
								      		<img src="assets/tea" alt=""></img>
								      		</div>				      		
						        		</label>
									</li>
								</ul>
							</div>

							<div>
								<label>
									<span>Twitter Profile</span>
									<input placeholder="Add a link to your Twitter profile" ref="tweet" type="text" tabIndex="3" required/>
								</label>
							</div>
							<div>
								<label>
									<span>LinkedIn Profile</span>
									<input placeholder="Add a link to your Linked in profile" type="text" ref="linkedIn" tabIndex="3" required/>
								</label>
							</div>
							<div className="error" ref="profileError"></div>
							<div className="submit-button">
								<button name="submit" type="submit" id="profilecreation-submit">Create Profile</button>
							</div>
						</form>

					</div>
					<div className="col4 col-on col-off"></div>
				</div>
         
        );
    },



	profile: function(e){
		e.preventDefault()
		var newUser = new ProfileModel({
			name: this.refs.registerName.getDOMNode().value,
			bio: this.refs.registerBio.getDOMNode().value,
			networkCircle: this.refs.networkCircle.getDOMNode().value,
			foodTypes: this.refs.foodTypes.getDOMNode().value,
			twitter: this.refs.tweet.getDOMNode().value,
			linkedIn: this.refs.linkedIn.getDOMNode().value

		});

		if(!newUser.isValid()) {
			this.refs.profileError.getDOMNode().innerHTML = newUser.validationError;
		}
		else {
			newUser.save();
			app.navigate('matches', {trigger: true});
		};
	},



});















