------------------------------------------------
-- 创建人   :  zhangqi	
-- 创建时间	:  2011-1-12
-- 效果备注	:  五毒_物件_仙王蛊鼎 点击释放技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function OnOpen(doodad, player)
	local owner = GetPlayer(doodad.dwOwnerID);
	local doodadleftcount = doodad.GetCustomInteger1(0)

	if doodadleftcount <= 0 then
		return false;
	end
	--如果owner在线，且处于组队状态
	if owner then 
		--获取doodad创建者所在队伍。
		--如果角色处于一个队伍中，那么这个函数返回一个包含队伍所有成员ID的table。该table的索引从1开始。
		local tParty = owner.GetPartyMemberList();		
		--判断player是否为owner的队友
		local bIsPartyMember = false;
		if tParty then
			for i = 1, table.getn(tParty) do 
				if player.dwID == tParty[i] then
					bIsPartyMember = true;
					break;
				end
			end
		end
		--如果player为队友或者自己，读取进度条
		if bIsPartyMember or player.dwID == owner.dwID then
			return true;
		else
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce",GetEditorString(3, 9055) , "red")
			return false;
		end
	else 
		return false;	
	end
end

function OnPerOpen(doodad, player)
	local owner = GetPlayer(doodad.dwOwnerID);
	local doodadleftcount = doodad.GetCustomInteger1(0)

	if doodadleftcount <= 0 then
		return false;
	end
	--如果owner在线，且处于组队状态
	if owner then 
		--获取doodad创建者所在队伍。
		--如果角色处于一个队伍中，那么这个函数返回一个包含队伍所有成员ID的table。该table的索引从1开始。
		local tParty = owner.GetPartyMemberList();		
		--判断player是否为owner的队友
		local bIsPartyMember = false;
		if tParty then
			for i = 1, table.getn(tParty) do 
				if player.dwID == tParty[i] then
					bIsPartyMember = true;
					break;
				end
			end
		end
		--如果player为队友或者自己，读取进度条
		if bIsPartyMember or player.dwID == owner.dwID then
			if  player.GetBuff(3448,1) then 
				player.SendSystemMessage(GetEditorString(3, 9056))
			else 
				player.AddBuff(0,99,2515,2,0)
				player.AddBuff(0,99,3448,1)
			end
			doodadleftcount = doodadleftcount - 1
			doodad.SetCustomInteger1(0,doodadleftcount)
			if doodadleftcount == 0 then
				doodad.SetDisappearFrames(4, false);
			end
			return true;
		else
			return false;
		end
	else 
		return false;	
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com