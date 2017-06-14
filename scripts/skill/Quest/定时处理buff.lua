---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/定时处理buff.lua
-- 更新时间:	2014/11/27 17:29:20
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(8661, 1) then
		player.DelBuff(8661, 1)
	end
	local nQuestIndex_14960 = player.GetQuestIndex(14960)
	if not nQuestIndex_14960 then
		player.SetDynamicSkillGroup(0)
	end
	--以下buff删除中有return，所以要放在最后呦
	if player.GetBuff(8556, 1) then
		local tbQuestId = {
			14960, 14972, 12740
		}
		for _, nQuestId in pairs(tbQuestId) do
			local nQuestIndex = player.GetQuestIndex(nQuestId)
			if nQuestIndex then
				return
			end
		end
		player.DelBuff(8556, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com