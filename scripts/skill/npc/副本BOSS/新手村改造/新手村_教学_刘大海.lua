---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/新手村改造/新手村_教学_刘大海.lua
-- 更新时间:	2014/7/23 11:55:46
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("MZ_you_" .. player.dwID)
	if npc then
		if npc.nCurrentLife > 1 then
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "teach_base.finish_teach" )
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com