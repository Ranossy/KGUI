---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_史朝义_炸弹计时.lua
-- 更新时间:	2014/3/20 15:42:56
-- 更新用户:	wangpengfei1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSrcID)
	local npcZ = GetNpc(dwCharacterID)
	if not npcZ then
		return
	end
	npcZ.CastSkill(8991, 1)
	npcZ.PlaySfx(689, npcZ.nX, npcZ.nY, npcZ.nZ)
	local nID = npcZ.GetCustomInteger4(1)
	local playertarget = GetPlayer(nID)
	if playertarget then
		if playertarget.GetBuff(7438, 1) then
			playertarget.DelBuff(7438, 1)
		end
	end
	npcZ.SetDisappearFrames(1, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com