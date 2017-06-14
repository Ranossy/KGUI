---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_钟林毓秀_被驱散脚本.lua
-- 更新时间:	2015/2/10 9:56:16
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_兰摧玉折_被驱散脚本.lua
-- 创建人    :  南剑
-- 创建时间  :  2008-03-28
-- 用途(模块):  BUFF功能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  默认的BUFF脚本
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local target
	if IsPlayer(nCharacterID) then
		target = GetPlayer(nCharacterID);
	else
		target = GetNpc(nCharacterID);
	end

	if not target then
		return
	end
	
	local Cast_plyer = GetPlayer(dwCasterID)
	local player = GetPlayer(dwSkillSrcID)

	--卸除后锁足4秒
	if nLeftFrame ~= 0 and player and target and player.GetScene().dwMapID == target.GetScene().dwMapID then
		target.AddBuff(player.dwID, player.nLevel, 9730, 1)
	end
	--[[
	if nLeftFrame ~= 0 and player and target and player.GetScene().dwMapID == target.GetScene().dwMapID and GetCharacterDistance(player.dwID, target.dwID) <= 64 * 40 then
		local nlev = player.GetSkillLevel(189)
		if nlev ~= 0 and Cast_plyer then
			if IsPlayer(target.dwID) then
				if player.bFightState == true then
					player.CastSkill(13741, nlev, TARGET.PLAYER, target.dwID)
				end
			else
				if player.bFightState == true then
					player.CastSkill(13741, nlev, TARGET.NPC, target.dwID)
				end
			end
		end
	end
	--]]
	if IsPlayer(nCharacterID) then
		target = GetPlayer(nCharacterID)
		if target and player and player.GetSkillLevel(6686) == 1 and nLeftFrame ~= 0 then
			--添加延迟buff
			
			if Cast_plyer then
				if target.bFightState == true or Cast_plyer.bFightState == true then
					target.AddBuff(0, 99, 9174, 1)
				end
			else
				--if target.bFightState == true then
				--	target.AddBuff(0, 99, 9174, 1)
				--end
			end
		end
	end
end;
function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com