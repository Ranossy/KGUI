------------------------------------------------
-- 文件名    :  英雄空雾峰_1号BOSS_夕罗双_夕罗双的嘲弄(BUFF).lua
-- 创建人    :  CBG	
-- 创建时间  :  2009-9-8
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  嗯
-- 技能名称  :  你猜
-- 技能效果  :  你知道的
------------------------------------------------

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return 
	end
	local scene = player.GetScene()
	if not scene then
		return 
	end
	local BOSS = scene.GetNpcByNickName("xiluoshuang")
	if not BOSS then
		return 
	end
    if nLeftFrame > 0 then -- 非正常结束
	local sum = Random(100)
	if sum >= 50 then
		local npc = scene.CreateNpc(5884, 16517, 22181, 0, 0, 240)
		if not npc then
			return
		end
		npc.DelBuff(1168,1)
		BOSS.CopyThreatList(npc.dwID)
	else
		local npc = scene.CreateNpc(5884, 15705, 24025, 0, 0, 240)
		if not npc then
			return
		end
		npc.DelBuff(1168,1)
		BOSS.CopyThreatList(npc.dwID)
  	end
    end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com