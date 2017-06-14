---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/苍云特殊武器_武器使用后状态结束取消动态技能栏.lua
-- 更新时间:	2016/6/7 16:21:16
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	player.DelBuff(11346,1)
	player.DelBuff(11036, 1)--标女和标男换动作（需要新的buffID)
	player.DelBuff(11036, 2)--正太和萝莉换动作（需要新的buffID)
	player.DelBuff(8576, 1)--盾墙无法再次盾墙
	player.DelBuff(10821, 1)--免控
	player.DelBuff(11106, 1)--炎帝反击开始图标为黑
	player.DelBuff(10823, 1)--争神炎舞开始图标为黑
	player.DelBuff(10824, 1)--特殊技能栏内技能变亮被击响应buff
	player.DelBuff(10825, 1)--寻首击山开始图标为黑
	player.DelBuff(11197, 1)--删除吸魂buff
	player.SetDynamicSkillGroup(0)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.PlayCharacterSound(19195)	
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com