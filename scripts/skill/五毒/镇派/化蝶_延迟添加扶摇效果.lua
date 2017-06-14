---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/镇派/化蝶_延迟添加扶摇效果.lua
-- 更新时间:	2017/3/19 16:44:42
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(9002)
	if lv ~= 0 then
		local buff = player.GetBuff(11816, 1)
		if not buff then
			return
		end
		local nCount = buff.nLeftActiveCount
		player.AddBuff(player.dwID, player.nLevel, 208, lv, nCount)
		player.DelBuff(11816,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com