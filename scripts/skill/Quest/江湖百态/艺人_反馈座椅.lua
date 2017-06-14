---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/����_��������.lua
-- ����ʱ��:	2016/7/12 23:59:16
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/������̬/����_��������.lua", -- ����ֵ1
		0														-- ����ֵ2
	)
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	-----------------����ʩ����̬����(����)----------------------------------------
	--skill.nNeedPoseState = 1    --�����̬��1Ϊ�浶��̬��2Ϊ�����̬

	----------------�����˺���С�ӻ�Ѫ------------------------------------------

	--skill.nDamageToLifeForParty = 0	--�����˺���С�ӳ�Ա�ٷֱȻ�Ѫ

	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 1072);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	--skill.nCostManaBasePercent = 0;							-- �������ĵ������ٷֱ�
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- ����Ϊtrueʱ,��ʾȫ�����Ķ���
	--skill.nNeedAccumulateCount = 0;				-- ������Ҫ����ĸ�������skill.bIsAccumulate	= trueʱ��Ч
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	--------------------�������ò���----------------------------------------------
	--skill.nSkillBulletType = 1;					--�ӵ�����(����Ϊ1���Ե�Ϊ3)
	--skill.nSkillBulletSubType = 0;				--�ӵ���������,(��BulletTypeһ��ȷ����ͬ�ӵ��Ĳ�ͬ���֣�ȡֵ��Χ0~256)
	--skill.nAnimationPlayFrame = 0 				--�ӳ���ʧ֡�������Ϊ�����ӵ��󶯻��ȴ�ʱ��,�����ӵ���Ŀ�꿪ʼ����,��ô��֮֡��,����sbsEnd��Ϣ������.
	--skill.nMaxHitCount = 1						--���似�ܵ���󹥻�����
	--skill.nMaxHitRadius = 1 * 64					--�����ͷ��ߵ��������޶�
	--skill.nMaxHoodleRadius = 10 * LENGTH_BASE  	--������������
	--skill.nMaxSearchCount = 1 					--�Ƿ����Ƶ���Ŀ��(0Ϊ���� 1Ϊֻ��һ��Ŀ��)
	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 20 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
	--skill.bInstantChannel = false;				-- ͨ�������Ƿ��������һ���˺�
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	--�������ж���ǰ5�ߴ��ܷ񴴽����ӣ��Ѿ������6�ߴ�����ǰ5�ߵ��ϰ����
	
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local actor = GetPlayer(dwSkillSrcID)
	if not actor then		
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then
		RemoteCallToClient(actor.dwID, "OnSendSystemAnnounce", GetEditorString(7, 2772), "red")
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "Ŀ�겻���ڡ�", 5)
		actor.SendSystemMessage(GetEditorString(0, 491))
		actor.ClearCDTime(1072)
		return
	end
	local scene = actor.GetScene()
	if not scene then
		return
	end
	--player.GetScene().CreateNpc(51969, player.nX, player.nY, player.nZ, nChairFace, -1, "biaoyanzongkong" .. player.dwID)
	--[[��Ч����ר�����������ж��Ƿ񴴽�������.  �����ɹ����ܿر���һֱ�м�¼,������Ϊ��������
	local chair_pss = scene.GetNpcByNickName("Artist_Chair_pss" .. actor.dwID)
	if chair_pss then
		RemoteCallToClient(actor.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "���Ѿ����ù������ˡ�", 5)
		actor.SendSystemMessage("���Ѿ����ù������ˡ�")
		actor.ClearCDTime(1072)
		return 
	end
	--]]
	local npcControl = scene.GetNpcByNickName("biaoyanzongkong" .. actor.dwID)
	if not npcControl then
		actor.ClearCDTime(1072)
		return 
	end
	local chair = GetNpc(npcControl.GetCustomInteger4(12))
	if chair then
		RemoteCallToClient(actor.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 2978), 5)
		actor.SendSystemMessage(GetEditorString(10, 2978))
		actor.ClearCDTime(1072)
		return 
	end
	--�������Ӽ�����Ч
	local radius = 5 --�뾶����
	local nDir = actor.nFaceDirection * 2 * math.pi / 256 --�����256ת����360��		
	local nChairX = actor.nX + radius * 64 * math.cos(nDir)
	local nChairY = actor.nY + radius * 64 * math.sin(nDir)
	local nChairFace = actor.nFaceDirection + 128
	chair = scene.CreateNpcWithEmployerID(51967, nChairX, nChairY, actor.nZ, nChairFace, 1 * GLOBAL.GAME_FPS, player.dwID)   --���δ���ʱһ�룬���λ�ú��ʣ������õ�300��
	chair_pss = scene.CreateNpc(51969, nChairX, nChairY, actor.nZ, nChairFace, 1 * GLOBAL.GAME_FPS, "Artist_Chair_pss" .. actor.dwID)   

	--������Ů
	local radius1 = 0.9 --�뾶����
	local seDir = nChairFace * 2 * math.pi / 256
	local seDir1 = seDir + (2 * math.pi / 4 - 10)  --����ˮƽ����һ�㣬��Լ100��
	local seDir2 = seDir - (2 * math.pi / 4 - 10)
	local nMaids1X = nChairX + radius1 * 64 * math.cos(seDir1)
	local nMaids1Y = nChairY + radius1 * 64 * math.sin(seDir1)
	local nMaids2X = nChairX + radius1 * 64 * math.cos(seDir2)
	local nMaids2Y = nChairY + radius1 * 64 * math.sin(seDir2)	
	local maids1 = scene.CreateNpcWithEmployerID(51966, nMaids1X, nMaids1Y, actor.nZ, nChairFace, 1 * GLOBAL.GAME_FPS, player.dwID)
	local maids2 = scene.CreateNpcWithEmployerID(51966, nMaids2X, nMaids2Y, actor.nZ, nChairFace, 1 * GLOBAL.GAME_FPS, player.dwID)
	
	npcControl.SetCustomInteger4(12, chair.dwID)
	npcControl.SetCustomInteger4(16, chair_pss.dwID)
	npcControl.SetCustomInteger4(20, maids1.dwID)
	npcControl.SetCustomInteger4(24, maids2.dwID)
	
	actor.SetTimer(0.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/����_��������.lua", player.dwID, 1)  --�ӳٲ�������Ĵ������������򲥲�����
	
--[[

   --]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end
function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("biaoyanzongkong" .. player.dwID)
	if not npc then
		player.ClearCDTime(1072)
		return 
	end
	if nParam2 == 1 then
		local chair = GetNpc(npc.GetCustomInteger4(12))
		local chair_pss = GetNpc(npc.GetCustomInteger4(16))
		local maids1 = GetNpc(npc.GetCustomInteger4(20))
		local maids2 = GetNpc(npc.GetCustomInteger4(24))
		if not chair or not chair_pss or not maids1 or not maids2 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 2979), 5)
			player.SendSystemMessage(GetEditorString(10, 2979))		
			player.SetTimer(0.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/����_��������.lua", 0, 2)
			return 
		end
		--ͨ�����Ӻ���Ҽ��Z���࣬�Լ����Ӻ���Ů֮���Z�������ж���Ҹ����Ƿ��иߵ�	
		if math.abs(player.nZ - chair.nZ) >= 256 or math.abs(chair.nZ - chair_pss.nZ) >= 128   
			or math.abs(chair.nZ - maids1.nZ) >= 128 or math.abs(chair.nZ - maids2.nZ) >= 128 then
			player.SendSystemMessage(GetEditorString(10, 2793))
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 2793), 4)
			player.SetTimer(0.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/����_��������.lua", 0, 2)
			return 
		end
		--��Ҫ���ж���ҵ������֮����ϰ�
		local nRetX1, nRetY1, nRetZ1 = scene.GetInterceptPoint(player.nX, player.nY, (player.nZ + 256), chair.nX, chair.nY, (chair.nZ + 256)) --�ж���߰�ߵ��ϰ�
		if nRetX1 ~= 0 or nRetY1 ~= 0 or nRetZ1 ~= 0 then
			player.SendSystemMessage(GetEditorString(10, 2793))
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 2793), 4)
			player.SetTimer(0.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/����_��������.lua", 0, 2)
			return
		end

		local supporter = GetPlayer(nParam1)
		if not supporter then
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", GetEditorString(7, 2772), "red")
			player.SendSystemMessage(GetEditorString(0, 491))
			player.SetTimer(0.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/����_��������.lua", 0, 2)
			return
		end
		
		supporter.SendSystemMessage(player.szName .. GetEditorString(10, 2980))
		RemoteCallToClient(supporter.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", player.szName .. GetEditorString(10, 2981), 4)	
		player.Talk(GetEditorString(10, 3022) .. supporter.szName .. GetEditorString(10, 3023))
		chair.SetDisappearFrames(299 * GLOBAL.GAME_FPS)
		chair_pss.SetDisappearFrames(299 * GLOBAL.GAME_FPS)
		maids1.SetDisappearFrames(299 * GLOBAL.GAME_FPS)
		maids2.SetDisappearFrames(299 * GLOBAL.GAME_FPS)
	elseif nParam2 == 2 then
		local chair = GetNpc(npc.GetCustomInteger4(12))
		local chair_pss = GetNpc(npc.GetCustomInteger4(16))
		local maids1 = GetNpc(npc.GetCustomInteger4(20))
		local maids2 = GetNpc(npc.GetCustomInteger4(24))
		if chair then
			chair.SetDisappearFrames(1)
		end
		if chair_pss then
			chair_pss.SetDisappearFrames(1)
		end
		if maids1 then
			maids1.SetDisappearFrames(1)
		end
		if maids2 then
			maids2.SetDisappearFrames(1)
		end
		player.SetTimer(0.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/����_��������.lua", 0, 3)		
	elseif nParam2 == 3 then
		player.ClearCDTime(1072)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com