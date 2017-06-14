---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������ħ��_��.lua
-- ����ʱ��:	2017/4/7 11:07:52
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ֣����
-- ����ʱ��	:  20120621
-- Ч����ע	:  ���̼���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nLunarDamage = 42 * 2 * 0.98, nLunarDamageRand = 42 * 2 * 0.04, nCostMana = 30 },
	{nLunarDamage = 77 * 2 * 0.98, nLunarDamageRand = 77 * 2 * 0.04, nCostMana = 50 },
	{nLunarDamage = 100 * 2 * 0.98, nLunarDamageRand = 100 * 2 * 0.04, nCostMana = 67 },
	{nLunarDamage = 123 * 2 * 0.98, nLunarDamageRand = 123 * 2 * 0.04, nCostMana = 93 },
	{nLunarDamage = 146 * 2 * 0.98, nLunarDamageRand = 146 * 2 * 0.04, nCostMana = 111},
	{nLunarDamage = 169 * 2 * 0.98, nLunarDamageRand = 169 * 2 * 0.04, nCostMana = 130},
	{nLunarDamage = 192 * 2 * 0.98, nLunarDamageRand = 192 * 2 * 0.04, nCostMana = 149},
	{nLunarDamage = 215 * 2 * 0.98, nLunarDamageRand = 215 * 2 * 0.04, nCostMana = 167},
	{nLunarDamage = 238 * 2 * 0.98, nLunarDamageRand = 238 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 262 * 2 * 0.98, nLunarDamageRand = 262 * 2 * 0.04, nCostMana = 186},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
	--"skill/����/����_������ħ��_��.lua",
	--0
	--);
	--������ĳ�̼��ܱ��buff����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		7795,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		4528,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		90,
		0
	);
	--��ӳ�滻����buff

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		4476,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/90����Ѩ/����AOE.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/90����Ѩ/���³��.lua",
		0
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL,
	--4476,
	--dwSkillLevel
	--);

	--�ӳٴ�2��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		4634,
		1
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 10 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 50; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

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
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local cNpc = cPlayer.GetSelectCharacter()
	if not cNpc then
		return
	end
	local distance = GetCharacterDistance(cPlayer.dwID, cNpc.dwID)
	if distance > 256 then
		local scene = cPlayer.GetScene()
		if not scene then
			return
		end
		local PI = 3.1416;
		local nAngel = PI / 2;
		local nR = 250;
		local nDir = cNpc.nFaceDirection;
		local dwAngel = (cNpc.nFaceDirection * 1.4 - 90) / 180 * PI + nAngel;
		local nCX = (cPlayer.nX + cNpc.nX) * 0.5
		local nCY = (cPlayer.nY + cNpc.nY) * 0.5
		local nCZ = (cPlayer.nZ + cNpc.nZ) * 0.5
		--local nResaultA = cPlayer.CastSkillXYZ(4062,1,nCX,nCY,cNpc.nZ)	--����Ŀ�걳���Ƿ�ɴ�
		--local nResaultB = cPlayer.CastSkill(3625, 1, TARGET.NPC, cNpc.dwID)	--����Ŀ��λ���Ƿ�ɴ�
		--if nResaultB ~= 1 then			--�ͷ�ʧ�ܺ󲹳�
		--cPlayer.ClearCDTime(503)
		--cPlayer.ClearCDTime(519)
		--cPlayer.SendSystemMessage("�޷�ʩչ��ʽ")
		--return
		--end
		--if nResaultA == 1  then		--��3D�ϰ��ɴ����Ŀ��ǰ��
		cPlayer.Stop()
		cPlayer.SetPosition(nCX, nCY, nCZ)
	end
	--[[
	if player.GetSkillLevel(17567) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 11866, 1,2)
	end
	--]]
	--cPlayer.TurnTo(cNpc.nFaceDirection)
	--cPlayer.SetTimer()
	--cPlayer.SetTimer(1, "scripts/skill/����/����_������Ӱ.lua", 0, 0)
	--else						--��3D�ϰ����ɴ����Ŀ��λ��
	--cPlayer.Stop()
	--cPlayer.SetPosition(cNpc.nX, cNpc.nY, cNpc.nZ)
	--cPlayer.TurnTo(cNpc.nFaceDirection)
	--cPlayer.SetTimer(3, "scripts/skill/����/����_������Ӱ.lua", 0, 0)
	--cPlayer.AddBuff(0,99,4322,1,1)	 			--�ӳ��о�ͷ
	--RemoteCallToClient(dwCharacterID, "OnSetViewRespond", 0)
	--end
	--cPlayer.AddBuff(0, 99, 4322, 1, 2)	 			--�ӳ��о�ͷ
	--cPlayer.CastSkill(4069,1)		--��CD
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com