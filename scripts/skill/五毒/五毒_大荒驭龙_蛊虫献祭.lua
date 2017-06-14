---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/�嶾_���Ԧ��_�Ƴ��׼�.lua
-- ����ʱ��:	2014/9/3 19:28:08
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  zhanghao
-- ����ʱ��	:  2010-12-8
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1}, --�嶾Ы
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1}, --�嶾��
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1}, --�嶾���
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1}, --�嶾���
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1}, --�嶾֩��
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1},
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1},
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1},
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1},
	{NpcTplID = 0, nSkillID = 0, nSkillLevel = 1},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�嶾/�嶾_���Ԧ��_�Ƴ��׼�.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ͨ�ý������
		ATTRIBUTE_TYPE.CAST_SKILL,
		7276,
		1
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 404);
	skill.SetCheckCoolDown(1, 444)
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
	skill.nCostManaBasePercent = 302;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 30 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
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
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult, SkillTarget)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local pet = GetNpc(player.dwPetID)
	if pet then
		return nPreResult;
	else
		return false;
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 5951, 1, 10)  --�����
	player.AddBuff(0, 99, 5950, 1, 4)	 --���


	if player.GetSkillLevel(14864) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 10180, 1)
		local nlev = player.GetSkillLevel(2212)
		if nlev ~= 0 then
			local rest, nleftframe, ntotalframe = player.GetSkillCDProgress(2212, nlev)
			if rest == true and nleftframe ~= 0 then
				player.ClearCDTime(400)
				ModityCDToUI(player, 2212, 0, 0)	
			end
		end
	end

	if player.GetSkillLevel(14869) == 1 then
		player.ClearCDTime(454)
	end
	
	local pet = GetNpc(player.dwPetID)
	if pet then
		if player.GetSkillLevel(6636) == 1 then  --��������AOE�˺�
			pet.CastSkill(6638, 1)
		end
		if player.GetSkillLevel(6637) == 1 then --��������AOE��
			pet.CastSkill(6639, 1)
		end

		--�׼���4�����40%
		if player.GetSkillLevel(14861) == 1 then
			player.AddBuff(player.dwID, player.nLevel, 9873, 1)
		end

		--[[
		if player.GetSkillLevel(6670) == 1 then  --��������AOE����
			pet.CastSkill(6671, 1)
		end
		--]]
		local PetType = pet.dwTemplateID;
		local scene = player.GetScene();
		if PetType == 9956 then 				--Ы��
			pet.AddBuff(0, 99, 2310, 2 )		--��ģBuff
			player.AddBuff(0, 99, 2541, 1, 20)
			player.CastSkillXYZ(2507, 1, pet.nX, pet.nY, pet.nZ)
			player.CastSkill(3023, 1)
			if player.GetSkillLevel(6035) == 1 and not (player.GetBuff(5774, 1)) then
				player.CastSkill(6197, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 5774, 1, 1)
			end
			if not (player.GetSkillLevel(6033) == 1 and (not player.GetBuff(5773, 1))) then
				pet.Die()
			end
		elseif PetType == 9999 then 				--���
			pet.AddBuff(0, 99, 2310, 3)		--��ģBuff
			player.AddBuff(0, 99, 2542, 1)
			player.CastSkill(3023, 1)
			if player.GetSkillLevel(6035) == 1 and not (player.GetBuff(5774, 1)) then
				player.CastSkill(6197, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 5774, 1, 1)
			end
			if not (player.GetSkillLevel(6033) == 1 and (not player.GetBuff(5773, 1))) then
				pet.Die()
			end
		elseif PetType == 9998 then 				--��
			pet.AddBuff(0, 99, 2310, 4)		--��ģBuff
			player.AddBuff(0, 99, 2543, 1)     --������ƣ���߶��Թ���
			player.CastSkill(3023, 1)   --���
			if player.GetSkillLevel(6035) == 1 and not (player.GetBuff(5774, 1)) then  --Ⱥ����
				player.CastSkill(6197, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 5774, 1, 1)
			end
			if not (player.GetSkillLevel(6033) == 1 and (not player.GetBuff(5773, 1))) then
				if pet.GetBuff(2829, 2) then
					pet.DelBuff(2829, 2)
				end
				pet.Die()
			end
		elseif PetType == 9996 then 				--���
			pet.AddBuff(0, 99, 2310, 5)		--��ģBuff
			player.CastSkill(2519, 1)
			if player.GetSkillLevel(6035) == 1 and not (player.GetBuff(5774, 1)) then
				player.CastSkill(6197, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 5774, 1, 1)
			end
			if not (player.GetSkillLevel(6033) == 1 and (not player.GetBuff(5773, 1))) then
				pet.Die()
			end
		elseif PetType == 9997 then 				--֩��
			pet.AddBuff(0, 99, 2310, 1)		--��ģBuff
			player.CastSkill(2520, 1)
			player.CastSkill(3023, 1)
			if player.GetSkillLevel(6035) == 1 and not (player.GetBuff(5774, 1)) then
				player.CastSkill(6197, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 5774, 1, 1)
			end
			if not (player.GetSkillLevel(6033) == 1 and (not player.GetBuff(5773, 1))) then
				pet.Die()
			end
		elseif PetType == 12944 then 				--����
			--pet.AddBuff(0, 99, 2310, 1)		--��ģBuff
			--player.CastSkillXYZ(2520, 1, pet.nX, pet.nY, pet.nZ)
			player.CastSkill(3023, 1)
			player.CastSkill(3061, 1)
			if player.GetSkillLevel(6035) == 1 and not (player.GetBuff(5774, 1)) then
				player.CastSkill(6197, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 5774, 1, 1)
				--player.PlaySfx(482,player.nX,player.nY,player.nZ)
			end
			if not (player.GetSkillLevel(6033) == 1 and (not player.GetBuff(5773, 1))) then
				pet.Die()
			end
			--��ħ_�����׼�������AOEЧ��
			if player.GetSkillLevel(9311) == 1 then
				player.AddBuff(player.dwID,player.nLevel,7983,1)
			end
		end
		if player.GetSkillLevel(6033) == 1 and (not player.GetBuff(5773, 1)) then
			player.AddBuff(dwCharacterID, player.nLevel, 5773, 1, 1)
		end
	end

	ModityCDToUI(player, 2226, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com