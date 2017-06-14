---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_�л�_ͨ������.lua
-- ����ʱ��:	2016/6/17 15:02:06
-- �����û�:	wangwei2
-- �ű�˵��:  
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/������̬/include/IdentityBaseFunc.lua")

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
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/������̬/��ʿ_�л�_ͨ������.lua", -- ����ֵ1
		0														-- ����ֵ2
	)
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		16002, -- ά�ַ�����ֵļ��ܣ��������ͷ�
		1
		);
	--]]
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
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 1056);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	--skill.nMaxRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	--skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames = 240;				-- ����֡�� 15S
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	skill.nChannelInterval = 16; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	skill.nChannelFrame = 480;	 			-- ͨ��������ʱ�䣬��λ֡��
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
	--�������������������
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	local scene = player.GetScene()
	if not scene then
		return
	end
	--�ж��󷨼���ķ�ʿ�ܵȼ�,
	local IdentifyManager = player.GetPlayerIdentityManager()
	if not IdentifyManager then
		return
	end
	if IdentifyManager.dwCurrentIdentityType ~= PLAYER_IDENTITY_TYPE.WIZARD then                 --��õ�ǰ�����
		return
	end
	local nExp = IdentifyManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --�����ݾ��飬						
	local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)

	local fazhen = scene.GetNpcByNickName("FaZhen" .. player.dwID)
	if not fazhen then
		player.CastSkill(15280, 1)     --����Լ�
		return
	end                                
	local nCastTime = fazhen.GetCustomInteger1(5) + 1   ---����0�����ܵȼ���1~4���ͷ���ID��5���ͷż��ܵĴ���,6���Ƿ񱻼��7���Ƿ����ӹ����飬8��ʩ���ߵķ�ʿ�ȼ�,9:Ҫ�ٻ��Ĺ��ȼ���������������ƥ�䣬10���Ƿ��Ѿ������˰��������
	if nCastTime == 29 then
		player.DoAction(0, 60064)
		fazhen.AddBuff(player.dwID, player.nLevel, 10961, 1)   --�ӳ�������ֵ�����
	elseif nCastTime < 30 then
		fazhen.AddBuff(player.dwID, player.nLevel, 10961, 1)
	elseif nCastTime == 30 then
		RemoteCallToClient(player.dwID, "JiangHuMatrix", "Close") 
	end
	fazhen.SetCustomInteger1(5, nCastTime)
	local tMatrix = {2, 6, 40}  --�ٻ���ͬ�������Ҫ�ķ�ʿ�ܵȼ�
	local targetghostLV = fazhen.GetCustomInteger1(9)
	if targetghostLV == 0 and fazhen.GetCustomInteger1(10) == 0 then
		--û�м�¼���ȼ�����һ����ͼ��Ľ���
		RemoteCallToClient(player.dwID, "JiangHuMatrix", "Open", 1, tMatrix[1], true)
		fazhen.SetCustomInteger1(10, 1)
	elseif targetghostLV >= 0 and fazhen.GetCustomInteger1(10) ~= 2 then
		RemoteCallToClient(player.dwID, "JiangHuMatrix", "Open", targetghostLV, tMatrix[targetghostLV], true)
		fazhen.SetCustomInteger1(10, 2)
	end

	local tGuaXiang = {
		[1] = "Zhen", 
		[2] = "Kun",
		[3] = "Gen",
		[4] = "Kan",
		[5] = "Xun",
		[6] = "Qian", 
		[7] = "Dui",
		[8] = "Li", 
	}
	local bActive = false
	for i = 1, 8 do	
		local zhenyan = scene.GetNpcByNickName("ZhenYan" .. i .. player.dwID)
		if zhenyan then
			zhenyan.SetDisappearFrames(1.2 * GLOBAL.GAME_FPS)                                  --�ӳ����۱��ֵ�����
			local dwActiveID = zhenyan.GetCustomInteger4(5)
			if dwActiveID > 0 then
				local activer = GetPlayer(dwActiveID)
				if activer then
					RemoteCallToClient(player.dwID, "JiangHuMatrix", "SetStatus", tGuaXiang[i], activer.szName)
					bActive = true
				end
			else
				RemoteCallToClient(player.dwID, "JiangHuMatrix", "SetStatus", tGuaXiang[i], false)
			end
			local n = zhenyan.GetCustomInteger1(0) --���������ߵķ�ʿ�ȼ�
			if n > 0 then
				nIdentifyLevel = nIdentifyLevel + n							
			end
		end
	end
	if not bActive then
		--RemoteCallToClient(player.dwID, "JiangHuMatrix", "Close")  --�����������ʾδ����
		RemoteCallToClient(player.dwID, "JiangHuMatrix", "SetActive", false)  --�����������ʾδ����
		fazhen.SetCustomInteger1(6, 0)  --���÷���δ����
		return
	end	
	fazhen.SetCustomInteger1(8, nIdentifyLevel)
	RemoteCallToClient(player.dwID, "JiangHuMatrix", "SetLevel", nIdentifyLevel) --���õ�ǰ������ĵȼ�
	--���ݷ�ʿ�ȼ��ж��ͷŵĻ���AOE�ȼ�
	local nLevel = 1
	--[[if nIdentifyLevel >= 40 then
		nLevel = 3
	elseif nIdentifyLevel >= 6 then
		nLevel = 2
	end--]]
	if nIdentifyLevel >= 25 then
		nLevel = 5
	elseif nIdentifyLevel >= 16 then
		nLevel = 4
	elseif nIdentifyLevel >= 8 then
		nLevel = 3
	elseif nIdentifyLevel >= 2 then
		nLevel = 2
	end
	fazhen.SetCustomInteger1(0, nLevel)   --�����ͷŵ��л�ȼ�
	fazhen.CastSkill(16008, 1)   --���Ұ����Ҫ�����ͷż��ܣ���Ҵ򲻵�
	--player.CastSkill(16002, nLevel)   --��Զ��ѵĹ��
	player.AddBuff(player.dwID, player.nLevel, 10964, 1)  --ʩչ����ı��BUFF
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com