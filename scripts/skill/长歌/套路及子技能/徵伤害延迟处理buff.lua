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
		if BuffID == 9390 then
			player.AddBuff(player.dwID, player.nLevel, 9381, 1)
			player.AddBuff(player.dwID, player.nLevel, 9382, 1)
		elseif BuffID == 9391 then
			player.AddBuff(player.dwID, player.nLevel, 9383, 1)
		elseif BuffID == 9392 then
			player.AddBuff(player.dwID, player.nLevel, 9384, 1)
			player.DelBuff(9382, 1)
		elseif BuffID == 9393 then
			player.AddBuff(player.dwID, player.nLevel, 9385, 1)
			player.DelBuff(9383, 1)
		elseif BuffID == 9394 then
			player.AddBuff(player.dwID, player.nLevel, 9498, 1)
			player.DelBuff(9384, 1)
		else
			player.DelBuff(9381, 1)
			player.DelBuff(9385, 1)
			player.DelBuff(9498, 1)
		end
	end
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com