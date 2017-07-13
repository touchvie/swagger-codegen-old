/**
 * Dive API
 * This is the Dive third party API official documentation
 *
 * OpenAPI spec version: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package io.swagger.client.api;

import io.swagger.client.ApiException;
import io.swagger.client.ApiInvoker;
import io.swagger.client.Pair;

import io.swagger.client.model.*;

import java.util.*;

import io.swagger.client.model.Card;
import io.swagger.client.model.ChannelStatus;
import io.swagger.client.model.MovieStatus;
import io.swagger.client.model.AccessToken;
import io.swagger.client.model.AuthError;

import org.apache.http.entity.mime.MultipartEntityBuilder;

import java.util.Map;
import java.util.HashMap;
import java.io.File;

public class DefaultApi {
  String basePath = "https://pre-api.touchvie.com/v1";
  ApiInvoker apiInvoker = ApiInvoker.getInstance();

  public void addHeader(String key, String value) {
    getInvoker().addDefaultHeader(key, value);
  }

  public ApiInvoker getInvoker() {
    return apiInvoker;
  }

  public void setBasePath(String basePath) {
    this.basePath = basePath;
  }

  public String getBasePath() {
    return basePath;
  }

  /**
   * Full card detail
   * Retrieves a full card detail, and optionally its relations to other cards
   * @param authorization Authorization token (&#39;Bearer &lt;token&gt;&#39;)
   * @param cardId Provided card ID (value of the &#39;card_id&#39; field)
   * @param version Provided card version (value of the &#39;version&#39; field)
   * @param acceptLanguage Client locale, as &lt;language&gt;-&lt;country&gt;
   * @param contentType application/json
   * @param relations Indicates if the received scene cards should contain the scene hierarchy (true) or be a flat list of the main scene items (false)
   * @param imageSize Size of the images returned in the response
   * @return Card
   */
  public Card  getCardVersion (String authorization, String cardId, String version, String acceptLanguage, String contentType, Boolean relations, String imageSize) throws ApiException {
    Object localVarPostBody = null;
    
    // verify the required parameter 'authorization' is set
    if (authorization == null) {
       throw new ApiException(400, "Missing the required parameter 'authorization' when calling getCardVersion");
    }
    
    // verify the required parameter 'cardId' is set
    if (cardId == null) {
       throw new ApiException(400, "Missing the required parameter 'cardId' when calling getCardVersion");
    }
    
    // verify the required parameter 'version' is set
    if (version == null) {
       throw new ApiException(400, "Missing the required parameter 'version' when calling getCardVersion");
    }
    

    // create path and map variables
    String localVarPath = "/cards/{card_id}/versions/{version}".replaceAll("\\{format\\}","json").replaceAll("\\{" + "card_id" + "\\}", apiInvoker.escapeString(cardId.toString())).replaceAll("\\{" + "version" + "\\}", apiInvoker.escapeString(version.toString()));

    // query params
    List<Pair> localVarQueryParams = new ArrayList<Pair>();
    // header params
    Map<String, String> localVarHeaderParams = new HashMap<String, String>();
    // form params
    Map<String, String> localVarFormParams = new HashMap<String, String>();

    localVarQueryParams.addAll(ApiInvoker.parameterToPairs("", "relations", relations));
    localVarQueryParams.addAll(ApiInvoker.parameterToPairs("", "image_size", imageSize));

    localVarHeaderParams.put("Authorization", ApiInvoker.parameterToString(authorization));
    localVarHeaderParams.put("Accept-Language", ApiInvoker.parameterToString(acceptLanguage));
    localVarHeaderParams.put("Content-Type", ApiInvoker.parameterToString(contentType));

    String[] localVarContentTypes = {
      "application/json"
    };
    String localVarContentType = localVarContentTypes.length > 0 ? localVarContentTypes[0] : "application/json";

    if (localVarContentType.startsWith("multipart/form-data")) {
      // file uploading
      MultipartEntityBuilder localVarBuilder = MultipartEntityBuilder.create();
      

      localVarPostBody = localVarBuilder.build();
    } else {
      // normal form params
          }

    try {
      String localVarResponse = apiInvoker.invokeAPI(basePath, localVarPath, "GET", localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarContentType);
      if(localVarResponse != null){
        return (Card) ApiInvoker.deserialize(localVarResponse, "", Card.class);
      }
      else {
        return null;
      }
    } catch (ApiException ex) {
      throw ex;
    }
  }
  /**
   * Channel sync availability
   * Checks if a list of client channel identifiers are currently broadcasting synchronizable content
   * @param authorization Authorization token (&#39;Bearer &lt;token&gt;&#39;)
   * @param channelIdList List of client channel IDs as a comma separated list
   * @param acceptLanguage Client locale, as &lt;language&gt;-&lt;country&gt;
   * @param contentType application/json
   * @return List<ChannelStatus>
   */
  public List<ChannelStatus>  getReadyChannels (String authorization, List<String> channelIdList, String acceptLanguage, String contentType) throws ApiException {
    Object localVarPostBody = null;
    
    // verify the required parameter 'authorization' is set
    if (authorization == null) {
       throw new ApiException(400, "Missing the required parameter 'authorization' when calling getReadyChannels");
    }
    
    // verify the required parameter 'channelIdList' is set
    if (channelIdList == null) {
       throw new ApiException(400, "Missing the required parameter 'channelIdList' when calling getReadyChannels");
    }
    

    // create path and map variables
    String localVarPath = "/channels/{channel_id_list}/ready".replaceAll("\\{format\\}","json").replaceAll("\\{" + "channel_id_list" + "\\}", apiInvoker.escapeString(channelIdList.toString()));

    // query params
    List<Pair> localVarQueryParams = new ArrayList<Pair>();
    // header params
    Map<String, String> localVarHeaderParams = new HashMap<String, String>();
    // form params
    Map<String, String> localVarFormParams = new HashMap<String, String>();


    localVarHeaderParams.put("Authorization", ApiInvoker.parameterToString(authorization));
    localVarHeaderParams.put("Accept-Language", ApiInvoker.parameterToString(acceptLanguage));
    localVarHeaderParams.put("Content-Type", ApiInvoker.parameterToString(contentType));

    String[] localVarContentTypes = {
      "application/json"
    };
    String localVarContentType = localVarContentTypes.length > 0 ? localVarContentTypes[0] : "application/json";

    if (localVarContentType.startsWith("multipart/form-data")) {
      // file uploading
      MultipartEntityBuilder localVarBuilder = MultipartEntityBuilder.create();
      

      localVarPostBody = localVarBuilder.build();
    } else {
      // normal form params
          }

    try {
      String localVarResponse = apiInvoker.invokeAPI(basePath, localVarPath, "GET", localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarContentType);
      if(localVarResponse != null){
        return (List<ChannelStatus>) ApiInvoker.deserialize(localVarResponse, "array", ChannelStatus.class);
      }
      else {
        return null;
      }
    } catch (ApiException ex) {
      throw ex;
    }
  }
  /**
   * Movie sync availability
   * Checks whether a list of client movie identifiers (Video On Demand) are available to be synchronized using the Dive API
   * @param authorization Authorization token (&#39;Bearer &lt;token&gt;&#39;)
   * @param clientMovieIdList List of client movie IDs, provided as a comma separated list
   * @param acceptLanguage Client locale, as &lt;language&gt;-&lt;country&gt;
   * @param contentType application/json
   * @return List<MovieStatus>
   */
  public List<MovieStatus>  getReadyMovies (String authorization, List<String> clientMovieIdList, String acceptLanguage, String contentType) throws ApiException {
    Object localVarPostBody = null;
    
    // verify the required parameter 'authorization' is set
    if (authorization == null) {
       throw new ApiException(400, "Missing the required parameter 'authorization' when calling getReadyMovies");
    }
    
    // verify the required parameter 'clientMovieIdList' is set
    if (clientMovieIdList == null) {
       throw new ApiException(400, "Missing the required parameter 'clientMovieIdList' when calling getReadyMovies");
    }
    

    // create path and map variables
    String localVarPath = "/movies/{client_movie_id_list}/ready".replaceAll("\\{format\\}","json").replaceAll("\\{" + "client_movie_id_list" + "\\}", apiInvoker.escapeString(clientMovieIdList.toString()));

    // query params
    List<Pair> localVarQueryParams = new ArrayList<Pair>();
    // header params
    Map<String, String> localVarHeaderParams = new HashMap<String, String>();
    // form params
    Map<String, String> localVarFormParams = new HashMap<String, String>();


    localVarHeaderParams.put("Authorization", ApiInvoker.parameterToString(authorization));
    localVarHeaderParams.put("Accept-Language", ApiInvoker.parameterToString(acceptLanguage));
    localVarHeaderParams.put("Content-Type", ApiInvoker.parameterToString(contentType));

    String[] localVarContentTypes = {
      "application/json"
    };
    String localVarContentType = localVarContentTypes.length > 0 ? localVarContentTypes[0] : "application/json";

    if (localVarContentType.startsWith("multipart/form-data")) {
      // file uploading
      MultipartEntityBuilder localVarBuilder = MultipartEntityBuilder.create();
      

      localVarPostBody = localVarBuilder.build();
    } else {
      // normal form params
          }

    try {
      String localVarResponse = apiInvoker.invokeAPI(basePath, localVarPath, "GET", localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarContentType);
      if(localVarResponse != null){
        return (List<MovieStatus>) ApiInvoker.deserialize(localVarResponse, "array", MovieStatus.class);
      }
      else {
        return null;
      }
    } catch (ApiException ex) {
      throw ex;
    }
  }
  /**
   * One-shot channel scene
   * Retrieves the list of cards related to the content currently being broadcasted in the provided channel
   * @param authorization Authorization token (&#39;Bearer &lt;token&gt;&#39;)
   * @param channelId Client channel ID
   * @param acceptLanguage Client locale, as &lt;language&gt;-&lt;country&gt;
   * @param contentType application/json
   * @param relations Indicates if the received scene cards should contain the scene hierarchy (true) or be a flat list of the main scene items (false)
   * @param imageSize Size of the images returned in the response
   * @return List<Card>
   */
  public List<Card>  getStaticChannelScene (String authorization, String channelId, String acceptLanguage, String contentType, Boolean relations, String imageSize) throws ApiException {
    Object localVarPostBody = null;
    
    // verify the required parameter 'authorization' is set
    if (authorization == null) {
       throw new ApiException(400, "Missing the required parameter 'authorization' when calling getStaticChannelScene");
    }
    
    // verify the required parameter 'channelId' is set
    if (channelId == null) {
       throw new ApiException(400, "Missing the required parameter 'channelId' when calling getStaticChannelScene");
    }
    

    // create path and map variables
    String localVarPath = "/channels/{channel_id}/static".replaceAll("\\{format\\}","json").replaceAll("\\{" + "channel_id" + "\\}", apiInvoker.escapeString(channelId.toString()));

    // query params
    List<Pair> localVarQueryParams = new ArrayList<Pair>();
    // header params
    Map<String, String> localVarHeaderParams = new HashMap<String, String>();
    // form params
    Map<String, String> localVarFormParams = new HashMap<String, String>();

    localVarQueryParams.addAll(ApiInvoker.parameterToPairs("", "relations", relations));
    localVarQueryParams.addAll(ApiInvoker.parameterToPairs("", "image_size", imageSize));

    localVarHeaderParams.put("Authorization", ApiInvoker.parameterToString(authorization));
    localVarHeaderParams.put("Accept-Language", ApiInvoker.parameterToString(acceptLanguage));
    localVarHeaderParams.put("Content-Type", ApiInvoker.parameterToString(contentType));

    String[] localVarContentTypes = {
      "application/json"
    };
    String localVarContentType = localVarContentTypes.length > 0 ? localVarContentTypes[0] : "application/json";

    if (localVarContentType.startsWith("multipart/form-data")) {
      // file uploading
      MultipartEntityBuilder localVarBuilder = MultipartEntityBuilder.create();
      

      localVarPostBody = localVarBuilder.build();
    } else {
      // normal form params
          }

    try {
      String localVarResponse = apiInvoker.invokeAPI(basePath, localVarPath, "GET", localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarContentType);
      if(localVarResponse != null){
        return (List<Card>) ApiInvoker.deserialize(localVarResponse, "array", Card.class);
      }
      else {
        return null;
      }
    } catch (ApiException ex) {
      throw ex;
    }
  }
  /**
   * One-shot movie scene
   * Retrieves the current list of cards related to the given movie scene
   * @param authorization Authorization token (&#39;Bearer &lt;token&gt;&#39;)
   * @param clientMovieId Client movie ID being played
   * @param timestamp Current movie timestamp in seconds
   * @param acceptLanguage Client locale, as &lt;language&gt;-&lt;country&gt;
   * @param contentType application/json
   * @param relations Indicates if the received scene cards should contain the scene hierarchy (true) or be a flat list of the main scene items (false)
   * @param imageSize Size of the images returned in the response
   * @return List<Card>
   */
  public List<Card>  getStaticMovieScene (String authorization, String clientMovieId, Float timestamp, String acceptLanguage, String contentType, Boolean relations, String imageSize) throws ApiException {
    Object localVarPostBody = null;
    
    // verify the required parameter 'authorization' is set
    if (authorization == null) {
       throw new ApiException(400, "Missing the required parameter 'authorization' when calling getStaticMovieScene");
    }
    
    // verify the required parameter 'clientMovieId' is set
    if (clientMovieId == null) {
       throw new ApiException(400, "Missing the required parameter 'clientMovieId' when calling getStaticMovieScene");
    }
    
    // verify the required parameter 'timestamp' is set
    if (timestamp == null) {
       throw new ApiException(400, "Missing the required parameter 'timestamp' when calling getStaticMovieScene");
    }
    

    // create path and map variables
    String localVarPath = "/movies/{client_movie_id}/static/{timestamp}".replaceAll("\\{format\\}","json").replaceAll("\\{" + "client_movie_id" + "\\}", apiInvoker.escapeString(clientMovieId.toString())).replaceAll("\\{" + "timestamp" + "\\}", apiInvoker.escapeString(timestamp.toString()));

    // query params
    List<Pair> localVarQueryParams = new ArrayList<Pair>();
    // header params
    Map<String, String> localVarHeaderParams = new HashMap<String, String>();
    // form params
    Map<String, String> localVarFormParams = new HashMap<String, String>();

    localVarQueryParams.addAll(ApiInvoker.parameterToPairs("", "relations", relations));
    localVarQueryParams.addAll(ApiInvoker.parameterToPairs("", "image_size", imageSize));

    localVarHeaderParams.put("Authorization", ApiInvoker.parameterToString(authorization));
    localVarHeaderParams.put("Accept-Language", ApiInvoker.parameterToString(acceptLanguage));
    localVarHeaderParams.put("Content-Type", ApiInvoker.parameterToString(contentType));

    String[] localVarContentTypes = {
      "application/json"
    };
    String localVarContentType = localVarContentTypes.length > 0 ? localVarContentTypes[0] : "application/json";

    if (localVarContentType.startsWith("multipart/form-data")) {
      // file uploading
      MultipartEntityBuilder localVarBuilder = MultipartEntityBuilder.create();
      

      localVarPostBody = localVarBuilder.build();
    } else {
      // normal form params
          }

    try {
      String localVarResponse = apiInvoker.invokeAPI(basePath, localVarPath, "GET", localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarContentType);
      if(localVarResponse != null){
        return (List<Card>) ApiInvoker.deserialize(localVarResponse, "array", Card.class);
      }
      else {
        return null;
      }
    } catch (ApiException ex) {
      throw ex;
    }
  }
  /**
   * Token endpoint
   * The token endpoint is used to obtain access tokens which allow clients to make API requests
   * @param authorization Basic authorization token (&#39;Basic &lt;client_key&gt;&#39;)
   * @param grantType Grant type used to obtain the token.
   * @param acceptLanguage Client locale, as &lt;language&gt;-&lt;country&gt;
   * @param contentType application/json
   * @param deviceId Device identifier, must uniquely identify the user or device accessing the API. Required only for \&quot;device_credentials\&quot; grant type
   * @param refreshToken Refresh token, used to issue a new token without resending client credentials. Required only for \&quot;refresh_token\&quot; grant type
   * @return AccessToken
   */
  public AccessToken  postToken (String authorization, String grantType, String acceptLanguage, String contentType, String deviceId, String refreshToken) throws ApiException {
    Object localVarPostBody = null;
    
    // verify the required parameter 'authorization' is set
    if (authorization == null) {
       throw new ApiException(400, "Missing the required parameter 'authorization' when calling postToken");
    }
    
    // verify the required parameter 'grantType' is set
    if (grantType == null) {
       throw new ApiException(400, "Missing the required parameter 'grantType' when calling postToken");
    }
    

    // create path and map variables
    String localVarPath = "/token".replaceAll("\\{format\\}","json");

    // query params
    List<Pair> localVarQueryParams = new ArrayList<Pair>();
    // header params
    Map<String, String> localVarHeaderParams = new HashMap<String, String>();
    // form params
    Map<String, String> localVarFormParams = new HashMap<String, String>();

    localVarQueryParams.addAll(ApiInvoker.parameterToPairs("", "grant_type", grantType));

    localVarHeaderParams.put("Authorization", ApiInvoker.parameterToString(authorization));
    localVarHeaderParams.put("Accept-Language", ApiInvoker.parameterToString(acceptLanguage));
    localVarHeaderParams.put("Content-Type", ApiInvoker.parameterToString(contentType));

    String[] localVarContentTypes = {
      "application/json"
    };
    String localVarContentType = localVarContentTypes.length > 0 ? localVarContentTypes[0] : "application/json";

    if (localVarContentType.startsWith("multipart/form-data")) {
      // file uploading
      MultipartEntityBuilder localVarBuilder = MultipartEntityBuilder.create();
      
      if (deviceId != null) {
        localVarBuilder.addTextBody("device_id", ApiInvoker.parameterToString(deviceId), ApiInvoker.TEXT_PLAIN_UTF8);
      }
      
      if (refreshToken != null) {
        localVarBuilder.addTextBody("refresh_token", ApiInvoker.parameterToString(refreshToken), ApiInvoker.TEXT_PLAIN_UTF8);
      }
      

      localVarPostBody = localVarBuilder.build();
    } else {
      // normal form params
      localVarFormParams.put("device_id", ApiInvoker.parameterToString(deviceId));
localVarFormParams.put("refresh_token", ApiInvoker.parameterToString(refreshToken));
    }

    try {
      String localVarResponse = apiInvoker.invokeAPI(basePath, localVarPath, "POST", localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarContentType);
      if(localVarResponse != null){
        return (AccessToken) ApiInvoker.deserialize(localVarResponse, "", AccessToken.class);
      }
      else {
        return null;
      }
    } catch (ApiException ex) {
      throw ex;
    }
  }
}