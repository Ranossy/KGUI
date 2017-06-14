----------------------------------------------------------------------
--Name: 扬州消失
--Date:		2009.1.21
--Author:	周萌
--Version: Alpha1
--Comment:	
----------------------------------------------------------------------

function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	--npc.SetDisappearFrames(32)	
	npc.GotoReviveList()
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com