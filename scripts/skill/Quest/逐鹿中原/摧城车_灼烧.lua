---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/逐鹿中原/摧城车_灼烧.lua
-- 更新时间:	2014/7/9 15:08:47
-- 更新用户:	lilin-kingsoft
-- 脚本说明:
----------------------------------------------------------------------<

function Apply(dwCharacter)
	local target
	if IsPlayer(dwCharacter) then
		target = GetPlayer(dwCharacter)
	else
		target = GetNpc(dwCharacter)
	end
	
	if not target then
		return
	end
	
	local nCostLife = math.min(target.nMaxLife * 0.05, 10000)
	if target.nCurrentLife <= nCostLife then
		target.Die()
		return
	end
	
	target.nCurrentLife = target.nCurrentLife - nCostLife
end

function UnApply(dwCharacter)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com