---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_地字一号_夜雪.lua
-- 更新时间:	2014/2/18 10:06:44
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local playerthis = GetPlayer(dwCharacterID)
	if not playerthis then
		return
	end
	local scene = playerthis.GetScene()
	if not scene then
		return
	end
	local npcBOSS = scene.GetNpcByNickName("BOSS_diziyihao")
	if npcBOSS then
		local nNum = npcBOSS.GetCustomInteger1(5)
		nNum = nNum + 1
		if scene.dwMapID == 177 then
			scene.CreateNpc(26120, playerthis.nX, playerthis.nY, playerthis.nZ, 0, -1, "yexue_" .. nNum)
		else
			scene.CreateNpc(36300, playerthis.nX, playerthis.nY, playerthis.nZ, 0, -1, "yexue_" .. nNum)
		end
		npcBOSS.SetCustomInteger1(5, nNum)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com