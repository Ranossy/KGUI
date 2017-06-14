---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/徵伤害延迟处理buff.lua
-- 更新时间:	2015/8/6 15:28:22
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/持续伤害被驱散后沉默.lua
-- 更新时间:	2015/8/5 23:00:36
-- 更新用户:	mengxiangfei11
-- 脚本说明:
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)

	local player = GetPlayer(nCharacterID)
	if player then
		if BuffID == 9448 then
			player.AddBuff(player.dwID, player.nLevel, 9443, 1)
			player.AddBuff(player.dwID, player.nLevel, 9444, 1)
		elseif BuffID == 9449 then
			player.AddBuff(player.dwID, player.nLevel, 9445, 1)
		elseif BuffID == 9450 then
			player.AddBuff(player.dwID, player.nLevel, 9446, 1)
			player.DelBuff(9444, 1)
		elseif BuffID == 9451 then
			player.AddBuff(player.dwID, player.nLevel, 9447, 1)
			player.DelBuff(9445, 1)
		elseif BuffID == 9452 then
			player.AddBuff(player.dwID, player.nLevel, 9500, 1)
			player.DelBuff(9446, 1)
		else
			player.DelBuff(9443, 1)
			player.DelBuff(9447, 1)
			player.DelBuff(9500, 1)
		end
	end
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com