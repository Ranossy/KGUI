---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/长歌门特殊武器_锁足结束.lua
-- 更新时间:	2016/3/10 19:25:01
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	
	local scene = player.GetScene()
	local yingzi1 = scene.GetNpcByNickName(player.dwID .. "yingzi1")
	local yingzi2 = scene.GetNpcByNickName(player.dwID .. "yingzi2")
	local yingzi3 = scene.GetNpcByNickName(player.dwID .. "yingzi3")
	if yingzi1 then
		yingzi1.PlaySfx(1279, yingzi1.nX, yingzi1.nY, yingzi1.nZ)
		yingzi1.SetDisappearFrames(1, 0)
	end

	if yingzi2 then
		yingzi2.PlaySfx(1279, yingzi2.nX, yingzi2.nY, yingzi2.nZ)
		--yingzi2.SetDisappearFrames(1, 0)
	end

	if yingzi3 then
		yingzi3.PlaySfx(1279, yingzi3.nX, yingzi3.nY, yingzi3.nZ)
		yingzi3.SetDisappearFrames(1, 0)
	end

	player.DelBuff(10539, 1)
	player.DelBuff(10540, 1)
	player.DelBuff(11198, 1)
	player.SetDynamicSkillGroup(0)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com