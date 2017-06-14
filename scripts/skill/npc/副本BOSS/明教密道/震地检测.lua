---------------------------------------------------------------------->
-- 脚本名称:	G:/zhugan/client/scripts/skill/npc/副本BOSS/明教密道/震地检测.lua
-- 更新时间:	2012-9-12 17:28:48
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local target = GetNpc(dwCharacterID)
	if not target then
		return
	end
	target.FireAIEvent(2001, 0, 0)
	local scene = target.GetScene()
	local tPlayer = scene.GetAllPlayer()
	local npc_zk3 = scene.GetNpcByNickName("zongkong3")
	if not npc_zk3 then
		return
	end
	for i = 1, #tPlayer do
		local CPlayer_ALL = GetPlayer(tPlayer[i])
		if CPlayer_ALL and CPlayer_ALL.nMoveState ~= MOVE_STATE.ON_DEATH then
			if GetCharacterDistance(npc_zk3.dwID, CPlayer_ALL.dwID) < (31 * 64)  then
				target.ModifyThreat(CPlayer_ALL.dwID, 100)
				return 1
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com