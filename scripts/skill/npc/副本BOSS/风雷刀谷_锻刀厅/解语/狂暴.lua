---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_锻刀厅/史朝英/狂暴.lua
-- 更新时间:	2017/4/6 19:53:21
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local scene = npc.GetScene()
	if npc then
		npc.PlaySfx(89,npc.nX,npc.nY,npc.nZ+200)
	end

	local tplayer = scene.GetAllPlayer()
	if tplayer then
		for i = 1, #tplayer do
			local playerThis = GetPlayer(tplayer[i])
			if playerThis then
				playerThis.Die()
			end
		end
	end

end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com