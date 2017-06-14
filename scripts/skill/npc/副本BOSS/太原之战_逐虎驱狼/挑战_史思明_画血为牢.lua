---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/挑战_史思明_画血为牢.lua
-- 更新时间:	2015/3/17 17:15:58
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("laolong" .. nCharacterID)
	if npc then
		npc.SetDisappearFrames(1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com