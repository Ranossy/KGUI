---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ɽʥȪ/��ɽʥȪ_3��_����.lua
-- ����ʱ��:	2015/5/8 14:36:16
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 14000, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 29300, nDamageRand = 0, nCostMana = 0}, --level 2
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

	----------------- ħ������ -------------------------------------------------
	--[[skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);--]]

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/npc/����BOSS/��ɽʥȪ/��ɽʥȪ_3��_����.lua", --����ֵ1
		0															--����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(1, 555, 1);						-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);
	--skill.SetCheckCoolDown(1, 444);

	----------------- ����������� ---------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(1, 1, 13863, 1)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 3;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 99 * LENGTH_BASE;					-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 99 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 25;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinChannelInterval = 1;-- ͨ�������ʱ��
	--skill.nChannelInterval = 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame = 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- ���߼������ -------------------------------------------------
	skill.nTargetRayTargetType = 2; --���Ŀ��Ϊnpc��player
	skill.nTargetRayWidth = 192; --������
	skill.nHeight = 128;

	----------------- ������ -------------------------------------------------
	--skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSrcID)
	local npctarget = GetNpc(dwCharacterID)
	local npc = GetNpc(dwSrcID)
	if not npc then
		return
	end
	
	local scene = npc.GetScene()
	if scene.dwMapID == 204 then
		if npctarget then
			if npctarget.dwTemplateID == 42402 then
				local huifuzhuangtaikongzhi = scene.GetNpcByNickName("huifuzhuangtaikongzhi")
				if huifuzhuangtaikongzhi then
					huifuzhuangtaikongzhi.SetCustomInteger1(2, 0)
				end
				if not npctarget.GetBuff(8881, 1) then
					npctarget.AddBuff(0, 99, 8847, 1)
					npctarget.AddBuff(0, 99, 8881, 1)
					npctarget.nCurrentLife = npctarget.nCurrentLife + npctarget.nMaxLife * 0.06
				end
			end
		end

		if npctarget then
			if npctarget.dwTemplateID == 43473 then
				if not npctarget.GetBuff(8881, 1) then
					npctarget.AddBuff(0, 99, 8847, 1)
					npctarget.AddBuff(0, 99, 8881, 1)
					npctarget.nCurrentLife = npctarget.nCurrentLife + npctarget.nMaxLife * 0.06
				end
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 42402 and npctarget.dwTemplateID ~= 43473 then
			if not npctarget.GetBuff(8881, 1) then
				npctarget.AddBuff(0, 99, 8848, 1, 10)
				npctarget.AddBuff(0, 99, 8881, 1)
				local npc = GetNpc(dwSrcID)
				if npc then
					npc.CastSkill(13861, 1, TARGET.NPC, npctarget.dwID)
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			if not player.GetBuff(8881, 1) then
				player.AddBuff(0, 99, 8848, 1, 10)
				player.AddBuff(0, 99, 8881, 1)
				local npc = GetNpc(dwSrcID)
				if npc then
					npc.CastSkill(13861, 1, TARGET.PLAYER, player.dwID)
				end
			end
		end
	end

	if scene.dwMapID == 227 then
		if npctarget then
			if npctarget.dwTemplateID == 46562 then
				local huifuzhuangtaikongzhi = scene.GetNpcByNickName("huifuzhuangtaikongzhi")
				if huifuzhuangtaikongzhi then
					huifuzhuangtaikongzhi.SetCustomInteger1(2, 0)
				end
				if not npctarget.GetBuff(8881, 2) then
					npctarget.AddBuff(0, 99, 8847, 2)
					npctarget.AddBuff(0, 99, 8881, 2)
					npctarget.nCurrentLife = npctarget.nCurrentLife + npctarget.nMaxLife * 0.08
				end
			end
		end

		if npctarget then
			if npctarget.dwTemplateID == 46586 then
				if not npctarget.GetBuff(8881, 2) then
					npctarget.AddBuff(0, 99, 8847, 2)
					npctarget.AddBuff(0, 99, 8881, 2)
					npctarget.nCurrentLife = npctarget.nCurrentLife + npctarget.nMaxLife * 0.08
				end
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 46562 and npctarget.dwTemplateID ~= 46586 then
			if not npctarget.GetBuff(8881, 2) then
				npctarget.AddBuff(0, 99, 8848, 2, 10)
				npctarget.AddBuff(0, 99, 8881, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					npc.CastSkill(13861, 2, TARGET.NPC, npctarget.dwID)
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			if not player.GetBuff(8881, 2) then
				player.AddBuff(0, 99, 8848, 2, 10)
				player.AddBuff(0, 99, 8881, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					npc.CastSkill(13861, 2, TARGET.PLAYER, player.dwID)
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com